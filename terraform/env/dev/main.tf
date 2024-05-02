# environments/dev/main.tf

provider "aws" {
  region = "us-gov-west-1" # AWS GovCloud (US) region
}

module "network" {
  source          = "../../modules/network"
  cidr_block      = "10.0.0.0/16"
  subnet_cidr     = "10.0.1.0/24"
  availability_zone = "us-gov-west-1a"
}

module "vpn" {
  source              = "../../modules/vpn"
  vpc_id              = module.network.vpc_id
  customer_gateway_id = var.customer_gateway_id
}

module "services" {
  source        = "../../modules/services"
  vpc_id        = module.network.vpc_id
  ami_id        = "ami-123456"  # Replace with actual AMI
  instance_type = "t2.micro"
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