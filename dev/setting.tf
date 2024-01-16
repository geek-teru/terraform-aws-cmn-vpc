# ----------------------------------------
# Provider Settings
# ----------------------------------------
provider "aws" {
  profile = "dev-terraform"
  region  = "ap-northeast-1"
}

####################################
# Terraform tfstate
####################################
#resource "aws_dynamodb_table" "cmn_ci_tfstate_lock" {
#  count = 1
#  name           = "cmn_ci_tfstate_lock"
#  read_capacity  = 1
#  write_capacity = 1
#  hash_key       = "LockID"
#  attribute {
#    name = "LockID"
#    type = "S"
#  }
#  lifecycle {
#    ignore_changes = ["read_capacity", "write_capacity"]
#  }
#}

terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    # prdとdevで異なるため、backend_configで指定する
  }
}