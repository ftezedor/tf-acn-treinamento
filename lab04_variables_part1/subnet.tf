############################################# LUCAS OMENA #############################################

# Data Sources permite um dado ser buscado ou computado para uso em qualquer referência dentro das 
# configurações do Terraform.
# https://www.terraform.io/language/data-sources

#######################################################################################################

data "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
}

# <block_type> "<label>" "<name_label>"
resource "aws_subnet" "second_subnet" {
  vpc_id = data.aws_vpc.vpc.id
  cidr_block = "10.0.21.0/24"

  tags = {
    "Name" = "second-subnet"
  }
}