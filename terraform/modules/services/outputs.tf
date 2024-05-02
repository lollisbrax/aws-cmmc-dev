output "vpc_id" {
  value = aws_vpc.service_vpc.id  # Ensure this resource is defined in services/main.tf
}
output "subnet_id" {
  value = aws_subnet.service_subnet.id  # Ensure this resource is defined in services/main.tf
}