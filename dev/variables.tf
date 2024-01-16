############################
# modules/vpc
############################
# vpc
variable "cmn_vpc_config" {
  type = map
}

# internet gateway
variable "cmn_igw_config" {
  type = map
}

# route table
variable "cmn_pub_rt_config" {
  type = map
}

# public subnet
variable "cmn_pub_subnet_config" {
  type = map
}

############################
# modules/securitygroup
############################
variable "sg_config" {
  type = list
}
