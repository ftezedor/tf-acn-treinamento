############################################# LUCAS OMENA #############################################

# Variáveis primitivas:
## String: sequência de caracteres representando algum texto
## Number: um valor numérico, podendo ser representado por inteiro ou fracionado
## Bool: valor condicional lógico (true ou false)
## Null: valor vazio representado por null sem aspas


# Coleções de Variáveis:
## List/Turple: representado por valores entre chaves ‘[ ]’ separados por vírgula
## Map: representado por um par de chave/valor entre colchetes ‘{ }’

# https://www.terraform.io/language/values/variables

#######################################################################################################

variable "region" {
  type = string
  default = "us-east-1"
}

variable "role_arn" {
  type = string
  default = "arn:aws:iam::902287633309:role/tf-acn-assume-role"
}

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}