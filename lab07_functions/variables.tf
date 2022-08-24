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

variable "region" {
  type = string
  default = "us-east-1"
}

variable "profile" {
  type = string
  default = "tf-acn-treinamento"
}

variable "vpc_cidr_block" {
  type = string
  default = "172.31.0.0/16"
}

variable "counter" {
  type = number
  default = 1
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