############################################# FELIPE GRUCCI #############################################

# Módulos são containers com múltiplos recursos que podem ser usados juntos.
# https://www.terraform.io/language/modules

#########################################################################################################

module "vpc" {
  source = "../vpc"

  // AWS ACCOUNT VARIABLES
  region  = var.region
  profile = var.profile
  
  //VPC
  vpcCDIRblock    = var.vpcCDIRblock
  instanceTenancy = var.instanceTenancy
  dnsSupport      = var.dnsSupport
  dnsHostnames    = var.dnsHostnames
  
  //PUBLIC SUBNETS
  publicCDIRblock_a = var.publicCDIRblock_a
  publicCDIRblock_b = var.publicCDIRblock_b
  mapPublicIP       = var.mapPublicIP
  
  //PRIVATE SUBNETS
  privateCDIRblock_a = var.privateCDIRblock_a
  privateCDIRblock_b = var.privateCDIRblock_b
  
  //SUBNET GENERAL PARAMETERS
  availabilityZone = var.availabilityZone

  // TAGGING
  prefixvpc          = var.prefixvpc
  prefixsubnet       = var.prefixsubnet
  environment        = var.environment
  purpose            = var.purpose
  number_of_sequence = var.number_of_sequence
}