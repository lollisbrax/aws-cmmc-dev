variable "ami_id" {
  description = "AMI ID for the instance"
}

variable "instance_type" {
  description = "Type of instance (e.g., t2.micro)"
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
}