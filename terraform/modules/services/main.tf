# Main VPC
resource "aws_vpc" "service_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Owl-Eye-VPC"
  }
}

# Main Subnet
resource "aws_subnet" "service_subnet" {
  vpc_id     = aws_vpc.service_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Main Subnet"
  }
}

# Main Security Group
resource "aws_security_group" "main_sg" {
  vpc_id = aws_vpc.service_vpc.id
  name   = "Main Security Group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Main Security Group"
  }
}

# Example EC2 instance in the main subnet
resource "aws_instance" "example_instance" {
  ami              = var.ami_id
  instance_type    = var.instance_type
  subnet_id        = aws_subnet.service_subnet.id
  vpc_security_group_ids = [aws_security_group.main_sg.id]

  tags = {
    Name = "ExampleInstance"
  }
}

# Additional VPCs, Subnets, and Instances
locals {
  vpc_configs = {
    "planet-3" = "10.1.0.0/16",
    "planet-4" = "10.2.0.0/16",
    "planet-5" = "10.3.0.0/16"
  }
}

resource "aws_vpc" "additional_vpcs" {
  for_each = local.vpc_configs
  cidr_block = each.value

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "additional_subnets" {
  for_each = local.vpc_configs
  vpc_id     = aws_vpc.additional_vpcs[each.key].id
  cidr_block = replace(each.value, "/16", "/24")  # Example modification of CIDR

  tags = {
    Name = "${each.key}-subnet"
  }
}

resource "aws_security_group" "additional_sgs" {
  for_each = local.vpc_configs
  vpc_id = aws_vpc.additional_vpcs[each.key].id
  name   = "${each.key}-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${each.key}-Security Group"
  }
}

resource "aws_instance" "additional_instances" {
  for_each = local.vpc_configs

  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.additional_subnets[each.key].id
  vpc_security_group_ids = [aws_security_group.additional_sgs[each.key].id]

  tags = {
    Name = "${each.key}-Instance"
  }
}