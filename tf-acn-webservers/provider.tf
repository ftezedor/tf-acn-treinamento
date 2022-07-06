############################################# TERRAFORM #############################################

terraform {
  backend "s3" {
    bucket  = "tf-state-083645284229"
    key     = "tf-acn-treinamento/lucasomena/tf-acn-webservers.tfstate"
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
}

############################################# TERRAFORM #############################################