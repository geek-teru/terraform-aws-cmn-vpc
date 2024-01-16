resource "aws_security_group" "sg" {
  for_each = { for i in var.sg_config : i.name => i }
  name = each.value.name
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = each.value.port
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = each.value.src_ip
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    managed_by = each.value.managed_by
  }
}