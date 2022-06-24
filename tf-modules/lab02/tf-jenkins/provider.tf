############################################# LUCAS OMENA #############################################

/*
1) Create Terraform Organization
2) Create Terraform Workspace
3) Run the command terraform login
4) Generate the API token from Web Browser
*/

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

provider "aws" {
  region = var.region
  assume_role {
    role_arn = var.role_arn
  }
}
