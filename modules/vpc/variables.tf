############################
# modules/vpc
############################
# vpc
variable "vpc_config" {
  type = map
}

# internet gateway
variable "igw_config" {
  type = map
}

# route table
variable "pub_rt_config" {
  type = map
}

# public subnet
variable "pub_subnet_config" {
  type = map
}
