############################################# TERRAFORM #############################################

# Terraform Providers são plugins utilizados para interagir e se conectar com sistemas remotos
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

############################################# TERRAFORM #############################################
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    access_key = "AKIA4GSDTRFWES5JG4EQ"
    secret_key = "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"
}