output "transit_gateway_id" {
  value       = aws_ec2_transit_gateway.main_tgw.id
  description = "The ID of the Transit Gateway"
}

output "inspection_vpc_attachment_id" {
  value       = aws_ec2_transit_gateway_vpc_attachment.inspection_vpc_attachment.id
  description = "The attachment ID for the Inspection VPC"
}

output "shared_services_vpc_attachment_id" {
  value       = aws_ec2_transit_gateway_vpc_attachment.shared_services_vpc_attachment.id
  description = "The attachment ID for the Shared Services VPC"
}
