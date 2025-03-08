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

resource "aws_route_table_association" "pub-rt-association" {
  for_each = var.pub_subnet_config

  subnet_id = aws_subnet.pub_subnet[each.key].id
  route_table_id = aws_route_table.pub_rt.id
}
