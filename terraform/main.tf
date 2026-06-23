module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
  # "10.0.0.0/16"
}

module "internet_gateway" {
  source   = "./modules/internet_gateway"
  vpc_id   = module.vpc.vpc_id
  igw_name = "terraform-igw"
}

module "subnet" {
  source      = "./modules/subnet"
  vpc_id      = module.vpc.vpc_id
  cidr_block  = var.subnet_cidr_block
  # "10.0.1.0/24"
}


module "route_table" {
  source         = "./modules/route_table"
  vpc_id         = module.vpc.vpc_id
  subnet_id      = module.subnet.subnet_id
  gateway_id     = module.internet_gateway.gateway_id
}



module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  subnet_id         = module.subnet.subnet_id
  security_group_id = module.security_group.sg_id
  key_name          = "login-key"
}

