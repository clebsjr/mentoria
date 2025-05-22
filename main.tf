module "vpc" {
  source      = "./modules/vpc"
  environment = "prd"
}

module "ec2" {
  source              = "./modules/ec2"
  environment         = "prd"
  key_name            = "chavesclebinho"
  subnet_id           = module.vpc.subnet_id
  subnet_secondary_id = module.vpc.subnet_secondary_id
  security_groups     = [module.vpc.sg.id]
  vpc_id              = module.vpc.vpc_id
}

module "ecs" {
  source              = "./modules/ecs"
  environment         = "prd"
  subnet_id           = module.vpc.subnet_id
  subnet_secondary_id = module.vpc.subnet_secondary_id
  vpc_id              = module.vpc.vpc_id
}
