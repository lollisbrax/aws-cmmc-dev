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
  source        = "../../modules/services"
  ami_id        = "ami-123456"  # Placeholder AMI ID
  instance_type = "t2.micro"
  subnet_id     = module.network.subnet_id
  vpc_id        = module.network.vpc_id
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