output "cmn_vpc" {
  value = aws_vpc.cmn-vpc
}

output "cmn_vpc_pub_subnets" {
  value = aws_subnet.pub_subnet[*]
}

output "cmn_vpc_priv_subnets" {
  value = aws_subnet.priv_subnet[*]
}
