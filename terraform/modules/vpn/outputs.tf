output "vpn_gateway_id" {
  value = aws_vpn_gateway.vpn_gw.id
  description = "The ID of the VPN gateway"
}

output "customer_gateway_id" {
  value = aws_customer_gateway.main_cgw.id
  description = "The ID of the customer gateway"
}