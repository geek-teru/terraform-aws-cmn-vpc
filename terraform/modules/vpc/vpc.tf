# vpc
resource "aws_vpc" "cmn-vpc" {
  cidr_block       = lookup(var.vpc_config, "cidr")
  instance_tenancy = "default"

  tags = {
    Name       = lookup(var.vpc_config, "name")
    managed_by = lookup(var.vpc_config, "managed_by")
  }
}