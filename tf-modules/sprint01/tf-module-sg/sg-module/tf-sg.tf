############################################# LUCAS OMENA #############################################

# Módulos são containers com múltiplos recursos que podem ser usados juntos.
# https://www.terraform.io/language/modules

#######################################################################################################

module "sg" {
  source = "../sg"
  // AWS ACCOUNT VARIABLES
  region  = var.region
  profile = var.profile

  // SECURITY GROUP
  vpc_cidr_block = var.vpc_cidr_block
  allowed_ports  = var.allowed_ports

  // TAGGING
  prefix             = var.prefix
  environment        = var.environment
  purpose            = var.purpose
  number_of_sequence = var.number_of_sequence
}
