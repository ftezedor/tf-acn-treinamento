############################################# TERRAFORM #############################################

# Terraform Providers são plugins utilizados para interagir e se conectar com sistemas remotos
# https://registry.terraform.io/providers/hashicorp/aws/latest

############################################# TERRAFORM #############################################
terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "terraform/lab05/network.tfstate"
    region = "us-east-1"
  }
  //backend "s3" {}
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

provider "aws" {
    region  = var.region
    profile = var.profile
}