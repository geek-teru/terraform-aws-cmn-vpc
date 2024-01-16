module "vpc" {
  source = "../modules/vpc"

  #vpc
  vpc_config = var.cmn_vpc_config

  #internet gateway
  igw_config = var.cmn_igw_config

  # route table
  pub_rt_config = var.cmn_pub_rt_config

  #public subnet
  pub_subnet_config = var.cmn_pub_subnet_config
}

module "security-group" {
  source = "../modules/security-group"

  vpc_id = module.vpc.cmn-vpc_id
  sg_config = var.sg_config
}