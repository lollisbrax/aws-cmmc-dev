variable "ami_id" {
  description = "AMI ID for the instance"
}

variable "instance_type" {
  description = "Type of instance (e.g., t2.micro)"
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
}
variable "vpc_id" {
  description = "The ID of the VPC where services will be deployed"
  type        = string
}