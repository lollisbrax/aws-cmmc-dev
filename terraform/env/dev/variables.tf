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
variable "subnet_id" {
  description = "The ID of the subnet where the instance will be launched"
  type        = string
  default     = "subnet-0a1b2c3d4e"  # Replace with the actual subnet ID
}

variable "security_group_id" {
  description = "The ID of the security group associated with the instance"
  type        = string
  default     = "sg-123abc45"  # Default value, replace with your actual security group ID
}