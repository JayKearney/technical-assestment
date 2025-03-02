
provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "project-tf-state-bucket-jk"
    key    = "database/terraform.tfstate"
    region = "us-east-1"
  }
}

# RDS Subnet Group
resource "aws_db_subnet_group" "postgresql" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.private_db_subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

# RDS PostgreSQL Instance
resource "aws_db_instance" "postgresql" {
  identifier             = "${var.project_name}-postgresql"
  engine                 = "postgres"
  engine_version         = "12.19"
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_allocated_storage
  storage_type           = "gp2"
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.postgresql.name
  vpc_security_group_ids = [var.db_security_group_id]
  multi_az               = true
  backup_retention_period = 7
  skip_final_snapshot    = false
  final_snapshot_identifier = "${var.project_name}-postgresql-final-snapshot"
  deletion_protection     = true
  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"

  tags = {
    Name = "${var.project_name}-postgresql"
  }
}

# RDS Read Replica for high availability
resource "aws_db_instance" "postgresql_replica" {
  identifier             = "${var.project_name}-postgresql-replica"
  replicate_source_db    = aws_db_instance.postgresql.identifier
  instance_class         = var.db_instance_class
  vpc_security_group_ids = [var.db_security_group_id]
  skip_final_snapshot    = true
  backup_retention_period = 0
  multi_az               = false

  tags = {
    Name = "${var.project_name}-postgresql-replica"
  }
}

# Outputs
output "db_endpoint" {
  value = aws_db_instance.postgresql.endpoint
}

output "db_replica_endpoint" {
  value = aws_db_instance.postgresql_replica.endpoint
}