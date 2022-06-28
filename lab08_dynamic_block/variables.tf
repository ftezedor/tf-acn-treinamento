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
  default = ""
}

variable "profile" {
  type = string
  default = ""
}

variable "vpc_cidr_block" {
  type = string
  default = ""
}

variable "environment" {
  type = string
  default = ""
}

variable "prefix" {
  type = string
  default = "tf"
}

variable "sequence" {
  type = number
  default = 1
}

variable "ingress_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = null
}

variable "custom_tags" {
  type = map(any)
  default = null
}

variable "cost_tags" {
  type = map(any)
  default = null
}