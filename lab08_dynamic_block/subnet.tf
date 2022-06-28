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

data "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "first_subnet" {
  vpc_id = data.aws_vpc.vpc.id
  
  cidr_block = cidrsubnet(data.aws_vpc.vpc.cidr_block, 8, 2) 

  tags = merge(var.custom_tags, var.cost_tags)
}