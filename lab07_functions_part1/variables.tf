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
  default = ""
}

variable "role_arn" {
  type = string
  default = ""
}

variable "vpc_cidr_block" {
  type = string
  default = ""
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

variable "standard_tags" {
  type = map(any)
  default = {
    "Purpose" = "Terraform Workshop"
  }
}

variable "cost_tags" {
  type = map(any)
  default = {
    "bussiness-unit" = "ACN"
    "department"     = "IC"
  }
}