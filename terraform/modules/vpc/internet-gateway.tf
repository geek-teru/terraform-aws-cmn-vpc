# internet gateway
resource "aws_internet_gateway" "cmn-vpc-igw" {
  vpc_id = aws_vpc.cmn-vpc.id

  tags = {
    Name        = "${var.env_name}-${var.sys_name}-igw"
    Environment = var.env_name
  }
}
