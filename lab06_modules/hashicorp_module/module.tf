############################################# LUCAS OMENA #############################################

# Módulos são containers com múltiplos recursos que podem ser usados juntos.
# https://www.terraform.io/language/modules

#######################################################################################################

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"
  # major.minor[.build[.revision]] (example: 1.2.12)

  name = "my-vpc"
  cidr = "10.10.0.0/16"

  azs             = ["eu-east-1a", "eu-east-1b", "eu-east-1c"]
  private_subnets = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  public_subnets  = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}