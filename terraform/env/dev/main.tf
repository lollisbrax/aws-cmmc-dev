provider "aws" {
  region = "us-west-1"
}

module "network" {
  source            = "../../modules/network"
  vpc_cidr          = var.vpc_cidr
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
}

module "vpn" {
  source              = "../../modules/vpn"
  vpc_id              = module.network.vpc_id
  customer_gateway_id = var.customer_gateway_id
}

module "services" {
  source             = "../../modules/services"
  subnet_id          = module.network.subnet_id  # Assuming network module outputs this
  security_group_id  = aws_security_group.example.id  # Ensure this SG is defined
  vpc_id             = module.network.vpc_id  # Corrected from vpc to network
  ami_id             = "ami-0965eacc05e445912"  # Ensure this is the correct AMI ID
  instance_type      = "t2.micro"  # Or any appropriate instance type
}

module "monitoring" {
  source = "../../modules/monitoring"
  vpc_id = module.network.vpc_id
}

module "transit" {
  source                     = "../../modules/transit"
  inspection_vpc_id          = module.network.vpc_id
  inspection_vpc_subnet_ids  = [module.network.subnet_id]
  shared_services_vpc_id     = module.services.vpc_id
  shared_services_vpc_subnet_ids = [module.services.subnet_id]
}

resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Security group for example usage"
  vpc_id      = module.network.vpc_id  # Ensure this is correctly referencing your VPC ID

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
    Name = "example"
  }
}