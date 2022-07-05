# tf-acn-treinamento
Laboratórios práticos e desafio prático para criação de ambiente



## Inicializando Terraform

Para inicializar o terraform, execute os comandos abaixo:

```sh
$ cd lab01_providers
$ terraform init
```

A pasta `.terraform` será criada após a inicialização contendo todos plugins necessários.

## Planejando a infraestrutura com Terraform

Para validar os recursos que serão implementados, execute o comando abaixo:

```sh
$ terraform plan
```

## Aplicando a infraestrutura com Terraform

Para efetivar a implementação dos recursos provisionados, execute o comando abaixo:

```sh
$ terraform apply
```
**Uma confirmação para implementação será solicitada 

## Refresh no arquivo State

O comando abaixo quando executado, realiza um escaneamento no provedor e validar modificações feitas manualmente fora do terraform e atualiza o arquivo State com essas modificações

```sh
$ terraform apply -refresh-only
```

## Conexão com AWS

Para conectar-se à AWS, utilize uma das opções abaixo:

### a) Configuração de profile

```sh
$ aws configure --profile tf-acn-treinamento
```

### b) Configuração de IAM Role

```sh
$ aws sts assume-role --role-arn arn:aws:iam::<aws-account-id>:role/<iam-role-name> --role-session-name "<session-name>" --profile <profile-name> --output json
$ export AWS_ACCESS_KEY_ID=<access-key-id>
$ export AWS_SECRET_ACCESS_KEY=<secret-key-id>
$ export AWS_SESSION_TOKEN=<session-token>
```
