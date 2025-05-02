output "cmn_vpc" {
  value = aws_vpc.cmn-vpc
}

output "cmn_vpc_pub_subnet_ids" {
  value = [
    for subnet in aws_subnet.pub_subnet : subnet.id
  ]
}

output "cmn_vpc_priv_subnet_ids" {
  value = [
    for subnet in aws_subnet.priv_subnet : subnet.id
  ]
}
