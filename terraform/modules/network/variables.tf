variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet within the VPC"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone to use"
  type        = string
}
data "aws_availability_zones" "available" {
  state = "available"
}