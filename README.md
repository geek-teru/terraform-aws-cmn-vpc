### 概要
* AWS環境の共通ネットワーク基盤
* 主にネットワークやセキュリティグループ

### 前提条件
* tfstate用S3バケットが作成されていること

### 構成図
![architecture_01](doc/architecture.drawio.png)

### 利用方法
## Terraform手順
```
# AWS credential setting
$ export AWS_ACCESS_KEY_ID=<your_access_key_id>
$ export AWS_SECRET_ACCESS_KEY=<your_secret_access_key>
$ export AWS_SESSION_TOKEN=<your_session_token>

# Terraform apply
$ docker compose run --rm terraform init
$ docker compose run --rm terraform plan -var-file=dev.tfvars
$ docker compose run --rm terraform apply -auto-approve -var-file=dev.tfvars
$ docker compose run --rm terraform destroy -var-file=dev.tfvars
```
