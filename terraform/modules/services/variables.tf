variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "Type of instance (e.g., t2.micro)"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
  type        = string
}
variable "vpc_id" {
  description = "The ID of the VPC where services will be deployed"
  type        = string
}
variable "security_group_id" {
  description = "Security group ID to attach to the EC2 instance"
  type        = string
}

