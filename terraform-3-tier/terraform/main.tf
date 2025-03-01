
provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "tf-state-bucket"
    key    = "root/terraform.tfstate"
    region = "us-east-1"
  }
}

# Import Network State
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "tf-state-bucket"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}

# Import Database State
data "terraform_remote_state" "database" {
  backend = "s3"
  config = {
    bucket = "tf-state-bucket"
    key    = "database/terraform.tfstate"
    region = "us-east-1"
  }
}

# Import Application State
data "terraform_remote_state" "application" {
  backend = "s3"
  config = {
    bucket = "tf-state-bucket"
    key    = "application/terraform.tfstate"
    region = "us-east-1"
  }
}

# Import Web State
data "terraform_remote_state" "web" {
  backend = "s3"
  config = {
    bucket = "tf-state-bucket"
    key    = "web/terraform.tfstate"
    region = "us-east-1"
  }
}

# Outputs
output "web_lb_dns_name" {
  value = data.terraform_remote_state.web.outputs.web_lb_dns_name
  description = "Public DNS name of the web load balancer"
}

output "db_endpoint" {
  value = data.terraform_remote_state.database.outputs.db_endpoint
  description = "Endpoint of the PostgreSQL database"
  sensitive = true
}

output "db_replica_endpoint" {
  value = data.terraform_remote_state.database.outputs.db_replica_endpoint
  description = "Endpoint of the PostgreSQL read replica"
  sensitive = true
}