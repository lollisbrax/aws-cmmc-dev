# VPN Gateway resource
resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "VPN Gateway"
  }
}

# Customer Gateway resource
resource "aws_customer_gateway" "main_cgw" {
  bgp_asn    = 65000
  ip_address = "1.2.3.4"
  type       = "ipsec.1"
  tags = {
    Name = "Main Customer Gateway"
  }
}

# VPN Connection resource
resource "aws_vpn_connection" "vpn_connection" {
  vpn_gateway_id     = aws_vpn_gateway.vpn_gw.id
  customer_gateway_id = var.customer_gateway_id
  type               = "ipsec.1"
  static_routes_only = true
  tags = {
    Name = "VPN Connection"
  }
}