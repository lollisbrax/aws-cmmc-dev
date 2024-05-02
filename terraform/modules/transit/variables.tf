variable "inspection_vpc_id" {
  description = "ID of the Inspection VPC"
  type        = string
}

variable "inspection_vpc_subnet_ids" {
  description = "List of subnet IDs in the Inspection VPC"
  type        = list(string)
}

variable "shared_services_vpc_id" {
  description = "ID of the Shared Services VPC"
  type        = string
}

variable "shared_services_vpc_subnet_ids" {
  description = "List of subnet IDs in the Shared Services VPC"
  type        = list(string)
}
