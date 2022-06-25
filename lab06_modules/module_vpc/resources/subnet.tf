############################################# TERRAFORM #############################################

# Data Sources permite um dado ser buscado ou computado para uso em qualquer referência dentro das 
# configurações do Terraform.
# https://www.terraform.io/language/data-sources

############################################# TERRAFORM #############################################

data "aws_vpc" "vpc" {
  id = var.vpc_id
}

resource "aws_subnet" "se_subnet" {
  vpc_id = data.aws_vpc.vpc.id
  cidr_block = "10.10.211.0/24"

  tags = {
    Environment = var.environment
  }
}