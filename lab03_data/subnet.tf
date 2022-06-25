############################################# TERRAFORM #############################################

# Data Sources permite um dado ser buscado ou computado para uso em qualquer referência dentro das 
# configurações do Terraform.
# https://www.terraform.io/language/data-sources

############################################# TERRAFORM #############################################

data "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
}

# <block_type> "<label>" "<name_label>"
resource "aws_subnet" "first_subnet" {
  vpc_id = data.aws_vpc.vpc.id
  cidr_block = "10.0.11.0/24"

  tags = {
    "Name" = "first-subnet"
  }
}