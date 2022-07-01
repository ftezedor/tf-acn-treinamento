############################################# TERRAFORM #############################################

terraform {
  backend "s3" {
    bucket  = "tf-state-929365926532"
    key     = "tf-acn-treinamento/tf-webservers.tfstate"
    region  = "us-east-1"
    profile = "tf-acn-treinamento"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile

  default_tags {
    tags = {
      Purpose = "Accenture - Treinamento Terraform"
      Owner1  = "Lucas Omena"
      Email1  = "lucas.omena@accenture.com"
      Owner2  = "Felipe Grucci"
      Email2  = "felipe.grucci@accenture.com"
    }
  }
}

############################################# TERRAFORM #############################################