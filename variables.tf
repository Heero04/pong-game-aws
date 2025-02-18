# AWS Region
variable "aws_region" {
  description = "AWS region to deploy in"
  default     = "us-east-1"
}

# EC2 Instance Type
variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

# Your VPN IP (this will be set in terraform.tfvars)
variable "my_ip" {
  description = "Your dedicated VPN IP"
  type        = string
}
