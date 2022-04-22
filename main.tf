module "vpc" {
  source = "./modules/vpc"
}

module "sg" {
  source = "./modules/sg"
  vpcid  = module.vpc.vpc_id
}

module "ec2" {
  source        = "./modules/ec2"
  public_SN_id  = module.vpc.public_sn_id
  private_SN_id = module.vpc.private_sn_id
  sg_id         = module.sg.sg_id
}
