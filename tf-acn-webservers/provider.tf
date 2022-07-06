############################################# TERRAFORM #############################################

terraform {
  /* backend "s3" {
    bucket  = "tf-state-929365926532"
    key     = "tf-acn-treinamento/tf-acn-webservers.tfstate"
    region  = "us-east-1"
    profile = "tf-acn-treinamento"
  } */
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
}

############################################# TERRAFORM #############################################