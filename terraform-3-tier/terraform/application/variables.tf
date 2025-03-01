
variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  default     = "three-tier-app"
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "private_app_subnet_ids" {
  description = "IDs of private application subnets"
  type        = list(string)
}

variable "app_security_group_id" {
  description = "ID of the application security group"
  type        = string
}

variable "db_endpoint" {
  description = "Endpoint of the PostgreSQL database"
  type        = string
}

variable "db_username" {
  description = "Master username for the database"
  sensitive   = true
}

variable "db_password" {
  description = "Master password for the database"
  sensitive   = true
}

variable "app_instance_type" {
  description = "EC2 instance type for application servers"
  default     = "t3.medium"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  default     = ""
}

variable "app_desired_capacity" {
  description = "Desired number of application instances"
  default     = 2
}

variable "app_min_size" {
  description = "Minimum number of application instances"
  default     = 2
}

variable "app_max_size" {
  description = "Maximum number of application instances"
  default     = 6
}