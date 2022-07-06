############################################# TERRAFORM #############################################

# Terraform inclui diversas built-in functions que podem ser chamadas dentro de uma expressão 
# para transformar e combinar valores. 
# https://www.terraform.io/language/functions

## Numeric Functions
## String Functions
## Collection Functions
## Encoding Functions
## Filesystem Functions
## Date and Time Functions
## Hash and Crypto Functions
## IP Network Functions
## Type Conversion Functions

############################################# TERRAFORM #############################################
locals {
  custom_tags = {
    "Lucas Omena" = "Group1"
    "Felipe Grucci" = "Group2"
  }

  collect_group = lookup(local.custom_tags, "Lucas Omena")
}

data "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "other_subnet" {
  count = var.counter

  vpc_id     = data.aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 12, count.index)

  tags = merge(var.standard_tags, var.cost_tags, local.custom_tags)
}
