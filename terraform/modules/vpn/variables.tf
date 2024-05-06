variable "vpc_id" {
  description = "The VPC ID to which the VPN Gateway attaches"
  type        = string
}

variable "customer_gateway_id" {
  description = "The ID of the customer gateway"
  type        = string
}