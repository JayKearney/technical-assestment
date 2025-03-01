
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

variable "public_subnet_ids" {
  description = "IDs of public subnets"
  type        = list(string)
}

variable "web_security_group_id" {
  description = "ID of the web security group"
  type        = string
}

variable "app_lb_dns_name" {
  description = "DNS name of the application load balancer"
  type        = string
}

variable "web_instance_type" {
  description = "EC2 instance type for web servers"
  default     = "t3.small"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  default     = ""
}

variable "web_desired_capacity" {
  description = "Desired number of web instances"
  default     = 2
}

variable "web_min_size" {
  description = "Minimum number of web instances"
  default     = 2
}

variable "web_max_size" {
  description = "Maximum number of web instances"
  default     = 6
}