variable "kubernetes_version" {
  description = "Kubernetes version"
}

variable "vpc_cidr" {
  description = "Default CIDR range of the VPC"
}

variable "aws_region" {
  description = "AWS region"
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
}