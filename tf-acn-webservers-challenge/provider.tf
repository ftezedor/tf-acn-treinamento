############################################# TERRAFORM #############################################

terraform {
  backend "s3" {
    # bucket  = "tf-state-file-<aws_account_id>"
    bucket = "tf-acn-statefile"
    # key     = "tf-acn-treinamento/<your_name>/tf-acn-webservers-challenge.tfstate"
    key     = "tf-acn-treinamento/ftz/tf-acn-webservers-challenge.tfstate"
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

resource "random_string" "suffix" {
  length  = 7
  lower   = true
  upper   = false
  special = false
}

############################################# TERRAFORM #############################################