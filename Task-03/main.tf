module "networking" {
  source      = "./modules/networking"
  vpc_cidr    = var.vpc_cidr
  environment = var.environment
}

module "compute" {
  source        = "./modules/compute"
  vpc_id        = module.networking.vpc_id
  instance_type = var.instance_type
  ami_id        = var.ami_id
  environment   = var.environment
}
