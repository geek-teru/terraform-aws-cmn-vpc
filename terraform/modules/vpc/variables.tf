variable "env_name" {
  type = string
}

variable "sys_name" {
  type = string
}

variable "aws_account_id" {
  type = string
}

# vpc
variable "vpc_config" {
  type = map(any)
}

# public subnet
variable "pub_subnet_config" {
  type = map(any)
}

# private subnet
variable "priv_subnet_config" {
  type = map(any)
}
