output "vpc_ids" {
  value = { for k, v in aws_vpc.additional_vpcs : k => v.id }
}

output "subnet_ids" {
  value = { for k, v in aws_subnet.additional_subnets : k => v.id }
}