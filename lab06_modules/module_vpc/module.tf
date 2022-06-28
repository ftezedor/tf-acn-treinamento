############################################# TERRAFORM #############################################

# Terraform Modules são os principais métodos para empacotar e reusar configuração no Terraform.

# Há dois tipos de Terraform Module:

## Root Module:
### A configuração do Terraform tem pelo menos um módulo que consiste em um recurso definido no arquivo .tf  
## Child Modules:
### Um módulo pode ser chamado por outros para incluir os recursos deles na configuração.

# https://www.terraform.io/language/modules

############################################# TERRAFORM #############################################

module "networking" {
  source = "./resources"

  // PROVIDER
  region  = var.region
  profile = var.profile

  // NETWORKING
  vpc_id = var.vpc_id

  // TAGS
  environment = var.environment
}
