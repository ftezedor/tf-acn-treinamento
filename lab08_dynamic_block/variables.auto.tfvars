############################################# TERRAFORM #############################################

# Variáveis primitivas:
## String: sequência de caracteres representando algum texto
## Number: um valor numérico, podendo ser representado por inteiro ou fracionado
## Bool: valor condicional lógico (true ou false)
## Null: valor vazio representado por null sem aspas


# Coleções de Variáveis:
## List/Turple: representado por valores entre colchetes ‘[ ]’ separados por vírgula
## Map: representado por um par de chave/valor entre chaves ‘{ }’

# https://www.terraform.io/language/values/variables

############################################# TERRAFORM #############################################

region         = "us-east-1"
profile        = "tf-acn-treinamento"
vpc_cidr_block = "10.11.0.0/16"
environment    = "dev"
sequence       = 1
prefix         = "tf"

ingress_rules = [{
  description = "Allow SSH"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]},
  {
  description = "Allow HTTPS"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]},
]

custom_tags = {
    "Purpose" = "Terraform Workshop"
}

cost_tags = {
    "bussiness-unit" = "ACN"
    "department"     = "IC"
}
