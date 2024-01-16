# vpc
resource "aws_vpc" "cmn-vpc" {
  cidr_block       = lookup(var.vpc_config, "cidr")
  instance_tenancy = "default"

  tags = {
    Name       = lookup(var.vpc_config, "name")
    managed_by = lookup(var.vpc_config, "managed_by")
  }
}

# internet gateway
resource "aws_internet_gateway" "cmn-vpc-igw" {
  vpc_id = aws_vpc.cmn-vpc.id

  tags = {
    Name       = lookup(var.igw_config, "name")
    managed_by = lookup(var.igw_config, "managed_by")
  }
}

resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.cmn-vpc.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.cmn-vpc-igw.id
    }
    tags = {
      Name       = lookup(var.pub_rt_config, "name")
      managed_by = lookup(var.pub_rt_config, "managed_by")
    }
}

resource "aws_subnet" "pub_subnet" {
  for_each = var.pub_subnet_config
  vpc_id            = aws_vpc.cmn-vpc.id
  availability_zone = each.value.az
  cidr_block        = each.value.cidr
  tags = {
    Name       = each.key
    managed_by = each.value.managed_by
  }
}

resource "aws_route_table_association" "pub-rt-association" {
  for_each = var.pub_subnet_config

  subnet_id = aws_subnet.pub_subnet[each.key].id
  route_table_id = aws_route_table.pub_rt.id
}

output "cmn-vpc_id" {
  value = aws_vpc.cmn-vpc.id
}