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

variable "vpc_id" {
  type = string
  default = "vpc-016462b1e6df750d7"
}

variable "counter" {
  type = number
  default = 2
}

variable "environment" {
  type = string
  default = "dev"

  validation {
    condition     = contains(["network", "sec", "shared", "dev", "pre", "pro"], var.environment)
    error_message = "The current support values are network, sec, shared, dev, pre or pro."
  }
}