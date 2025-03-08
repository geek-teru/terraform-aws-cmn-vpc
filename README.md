## 概要
* AWS環境の共通ネットワーク基盤
* 主にネットワークやセキュリティグループ

## 前提条件
* tfstate用S3バケットが作成されていること

## 構成図
![architecture_01](doc/architecture.drawio.png)

## 利用方法

### 変更差分確認

* PR作成時にGitHub Actionsが発火し、terraform planを実行する。

* ローカルから確認
以下の手順でdocker-composeでterraform planする。

```
# AWS credential setting
$ export AWS_ACCESS_KEY_ID=<your_access_key_id>
$ export AWS_SECRET_ACCESS_KEY=<your_secret_access_key>
$ export AWS_SESSION_TOKEN=<your_session_token>

# plan
$ docker compose run --rm terraform init
$ docker compose run --rm terraform plan -var-file=dev.tfvars
```

### デプロイ

* GitHub Actionsでデプロイ
リポジトリ > Actions > terraform-applyを実行する。

* ローカルからデプロイ
上記の差分確認手順を実施したうえで、以下の手順でapplyする。

```
# apply
$ docker compose run --rm terraform apply -auto-approve -var-file=dev.tfvars
```

### 削除

* ローカルから削除
上記の差分確認手順を実施したうえで、以下の手順で削除する。

```
# 削除の差分確認
$ docker compose run --rm terraform plan -destroy -var-file=dev.tfvars

# 削除
$ docker compose run --rm terraform destroy -var-file=dev.tfvars
```
