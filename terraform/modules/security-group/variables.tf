variable "env" {
  type    = string
  default = "prd"
}

variable "sys_name" {
  type    = string
  default = "cmn"
}

data "aws_caller_identity" "current" {}

variable "vpc_id" {
  type = string
}

variable "sg_config" {
  type = list(any)
}