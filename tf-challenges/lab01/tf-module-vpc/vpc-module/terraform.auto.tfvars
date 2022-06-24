// AWS ACCOUNT VARIABLES
region  = "us-east-1"
profile = "tf-acn-workshop"

//VPC
vpcCDIRblock    = "10.0.0.0/16"
instanceTenancy = "default"
dnsSupport      = true
dnsHostnames    = true

//PUBLIC SUBNETS
publicCDIRblock_a = "10.0.3.0/24"
publicCDIRblock_b = "10.0.4.0/24"
mapPublicIP       = false

//PRIVATE SUBNETS
privateCDIRblock_a = "10.0.1.0/24"
privateCDIRblock_b = "10.0.2.0/24"

//SUBNET GENERAL PARAMETERS
availabilityZone = ["us-east-1a", "us-east-1c"]
// TAGGING
prefixvpc          = "VPC"
prefixsubnet       = "SUBNET"
environment        = "workshop"
purpose            = "tf"
number_of_sequence = 1
