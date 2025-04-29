# public subnet
resource "aws_subnet" "pub_subnet" {
  for_each          = var.pub_subnet_config
  vpc_id            = aws_vpc.cmn-vpc.id
  availability_zone = each.value.az
  cidr_block        = each.value.cidr
  tags = {
    Name       = "${var.env_name}-${var.sys_name}-public-${each.key}"
    managed_by = each.value.managed_by
  }
}

# private subnet
resource "aws_subnet" "priv_subnet" {
  for_each          = var.priv_subnet_config
  vpc_id            = aws_vpc.cmn-vpc.id
  availability_zone = each.value.az
  cidr_block        = each.value.cidr
  tags = {
    Name       = "${var.env_name}-${var.sys_name}-private-${each.key}"
    managed_by = each.value.managed_by
  }
}
