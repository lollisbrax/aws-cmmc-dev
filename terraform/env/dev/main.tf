provider "aws" {
  region = "us-west-1"
}

module "network" {
  source            = "../../modules/network"
  vpc_cidr          = "10.0.0.0/16"  # Example CIDR
  subnet_cidr       = "10.0.1.0/24"  # Example CIDR
  availability_zone = "us-west-1a"
}

#module "vpn" {
#  source = "../../modules/vpn"
#  vpc_id = module.network.vpc_id  # Ensure this is the only required variable for setup
#}

module "services" {
  source             = "../../modules/services"
  subnet_id          = module.network.subnet_id
  security_group_id  = aws_security_group.example.id
  vpc_id             = module.network.vpc_id
  ami_id             = "ami-0965eacc05e445912"
  instance_type      = "t2.micro"
}

module "monitoring" {
  source = "../../modules/monitoring"
  vpc_id = module.network.vpc_id
}

resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Security group for example usage"
  vpc_id      = module.network.vpc_id

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

module "security" {
  source = "../../modules/security"
  vpc_id = module.network.vpc_id
}

module "cost_management" {
  source = "../../modules/cost_management"
}