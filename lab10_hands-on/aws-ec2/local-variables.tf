############################################# LUCAS OMENA #############################################

# HANDS-ON LABS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

#######################################################################################################

// LOCAL VARIABLES
locals {
  ec2_name = join("-", [var.prefix, join("", [var.environment, format("%01d", var.number_of_sequence)])])
  environments = {
    "dev"     = "development"
    "pre"     = "pre-production"
    "pro"     = "production"
    "network" = "networking"
    "shared"  = "shared-services"
    "sec"     = "security"
  }

  environment = local.environments[var.environment]
}