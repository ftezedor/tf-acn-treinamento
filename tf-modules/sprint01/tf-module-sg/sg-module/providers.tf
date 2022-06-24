############################################# LUCAS OMENA #############################################

# Terraform Providers são plugins utilizados para interagir e se conectar com sistemas remotos
# https://registry.terraform.io/providers/hashicorp/aws/latest

#######################################################################################################
provider "aws" {
  region                  = var.region
  profile                 = var.profile
  shared_credentials_file = var.shared_credentials_file

  default_tags {
    tags = {
      "Purpose"   = "Accenture Terraform Workshop"
      "ManagedBy" = "Terraform"
    }
  }
}
