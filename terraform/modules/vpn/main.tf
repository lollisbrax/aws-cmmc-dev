# VPN Gateway
resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "VPN Gateway"
  }
}

# VPN Connection
resource "aws_vpn_connection" "vpn_connection" {
  vpn_gateway_id     = aws_vpn_gateway.vpn_gw.id
  customer_gateway_id = aws_customer_gateway.main_cgw.id  # Referencing the new customer gateway
  type               = "ipsec.1"
  static_routes_only = true

  tags = {
    Name = "VPN Connection"
  }
}
# Create a Customer Gateway
resource "aws_customer_gateway" "main_cgw" {
  bgp_asn    = 65000  # Example ASN, use appropriate ASN for your setup
  ip_address = "1.2.3.4"  # Public IP address of your on-premises VPN device
  type       = "ipsec.1"

  tags = {
    Name = "Main Customer Gateway"
  }
}
