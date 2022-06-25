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
role_arn       = "arn:aws:iam::902287633309:role/tf-acn-assume-role"
vpc_cidr_block = "10.0.0.0/16"
counter        = 5
environment    = "dev"

standard_tags = {
    "Purpose" = "Terraform Workshop"
}
