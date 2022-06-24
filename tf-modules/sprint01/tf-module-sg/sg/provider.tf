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