output "cmn_vpc_sgs" {
  value = aws_security_group.sg[*]
}