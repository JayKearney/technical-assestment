
variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  default     = "three-tier-app"
}

variable "private_db_subnet_ids" {
  description = "IDs of private DB subnets"
  type        = list(string)
}

variable "db_security_group_id" {
  description = "ID of the database security group"
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance class"
  default     = "db.t3.medium"
}

variable "db_allocated_storage" {
  description = "Allocated storage for RDS (in GB)"
  default     = 20
}

variable "db_name" {
  description = "Name of the database"
  default     = "appdb"
}

variable "db_username" {
  description = "Master username for the database"
  default     = "dbadmin"
  sensitive   = true
}

variable "db_password" {
  description = "Master password for the database"
  sensitive   = true
}