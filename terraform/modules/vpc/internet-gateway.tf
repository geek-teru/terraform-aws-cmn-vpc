# internet gateway
resource "aws_internet_gateway" "cmn-vpc-igw" {
  vpc_id = aws_vpc.cmn-vpc.id

  tags = {
    Name       = lookup(var.igw_config, "name")
    managed_by = lookup(var.igw_config, "managed_by")
  }
}
