resource "aws_ec2_transit_gateway" "main_tgw" {
  description = "Central Transit Gateway"
  tags = {
    Name = "Main Transit Gateway"
  }
}

resource "aws_ec2_transit_gateway_route_table" "main_tgw_rt" {
  transit_gateway_id = aws_ec2_transit_gateway.main_tgw.id
  tags = {
    Name = "Main Transit Gateway Route Table"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "inspection_vpc_attachment" {
  vpc_id            = var.inspection_vpc_id
  transit_gateway_id = aws_ec2_transit_gateway.main_tgw.id
  subnet_ids        = var.inspection_vpc_subnet_ids
  tags = {
    Name = "Inspection VPC Attachment"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "shared_services_vpc_attachment" {
  vpc_id            = var.shared_services_vpc_id
  transit_gateway_id = aws_ec2_transit_gateway.main_tgw.id
  subnet_ids        = var.shared_services_vpc_subnet_ids
  tags = {
    Name = "Shared Services VPC Attachment"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "inspection_vpc_rt_assoc" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.inspection_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.main_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route_table_association" "shared_services_vpc_rt_assoc" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.shared_services_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.main_tgw_rt.id
}