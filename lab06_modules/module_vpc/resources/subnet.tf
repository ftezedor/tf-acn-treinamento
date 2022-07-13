############################################# TERRAFORM #############################################

# Data Sources permite um dado ser buscado ou computado para uso em qualquer referência dentro das 
# configurações do Terraform.
# https://www.terraform.io/language/data-sources

############################################# TERRAFORM #############################################

data "aws_vpc" "vpc" {
  id = var.vpc_id
}

resource "aws_subnet" "se_subnet" {
  count = var.counter

  vpc_id     = data.aws_vpc.vpc.id
  cidr_block = "172.31.21${count.index}.0"

  tags = {
    Name        = "subnet-module-0${sum([1, count.index])}"
    Environment = var.environment
    CreatedBy   = "Terraform Module"
  }
}