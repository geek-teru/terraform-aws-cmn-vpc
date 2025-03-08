# vpc
cmn_vpc_config = {
  cidr = "10.10.0.0/16",
  name    = "dev-cmn-vpc",
  managed_by = "terraform"
}

# internet gateway
cmn_igw_config = {
  name    = "dev-cmn-vpc-igw",
  managed_by = "terraform"
}

# route table
cmn_pub_rt_config = {
  name    = "dev_cmn_public_rt",
  managed_by = "terraform"
}

# subnet
# { nametag, az, cidr, managed_bytag }
cmn_pub_subnet_config = {
  cmn-pub-subnet-a = { az = "ap-northeast-1a", cidr = "10.10.10.0/24", managed_by = "terraform"},
  cmn-pub-subnet-c = { az = "ap-northeast-1c", cidr = "10.10.20.0/24", managed_by = "terraform"}
  cmn-pub-subnet-c = { az = "ap-northeast-1c", cidr = "10.10.21.0/24", managed_by = "terraform"},
  cmn-pub-subnet-d = { az = "ap-northeast-1d", cidr = "10.10.31.0/24", managed_by = "terraform"}
}

cmn_priv_subnet_config = {
  cmn-priv-subnet-a = { az = "ap-northeast-1a", cidr = "10.10.110.0/24", managed_by = "terraform"},
  cmn-priv-subnet-c = { az = "ap-northeast-1c", cidr = "10.10.120.0/24", managed_by = "terraform"},
  cmn-priv-subnet-d = { az = "ap-northeast-1d", cidr = "10.10.130.0/24", managed_by = "terraform"}
}


#security group
# { nametag, port, source ip, managed_bytag }
sg_config = [
  { name = "dev_cmn_linux_sg",   port = [ 22 ],   src_ip = [ "0.0.0.0/0" ], managed_by = "terraform" },
  { name = "dev_cmn_windows_sg", port = [ 3389 ], src_ip = [ "0.0.0.0/0" ], managed_by = "terraform" },
  { name = "dev_cmn_http_sg",    port = [ 80 ],   src_ip = [ "0.0.0.0/0" ], managed_by = "terraform" },
  { name = "dev_cmn_https_sg",   port = [ 443 ],  src_ip = [ "0.0.0.0/0" ], managed_by = "terraform" }
]

