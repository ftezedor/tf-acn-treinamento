// PROVIDER
provider "aws" {
  region                  = var.region
  profile                 = var.profile

  default_tags {
    tags = {
      "Purpose"      = "Accenture Terraform Workshop"
      "ManagedBy"    = "Terraform"
    }
  }
}

// LOCAL VARIABLES
locals {
  naming = join("-", [var.prefix, var.purpose, var.environment, format("%02d", var.number_of_sequence)])
}