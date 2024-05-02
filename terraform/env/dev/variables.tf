variable "customer_gateway_id" {
  description = "ID of the customer gateway for the VPN"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the primary subnet within the VPC"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Default AWS Availability Zone"
  type        = string
  default     = "us-west-1"
}