# vpc
resource "aws_vpc" "cmn-vpc" {
  cidr_block       = var.vpc_config.cidr
  instance_tenancy = "default"

  tags = {
    Name       = var.vpc_config.name
    managed_by = var.vpc_config.managed_by
  }
}