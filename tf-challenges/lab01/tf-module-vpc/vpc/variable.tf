// AWS ACCOUNT
variable "region" {
  description = "(Required) AWS Region."
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "(Required) AWS Profile configured."
  type        = string
}

// TAGGING
variable "prefixvpc" {
  description = "(Optional) TF ACN Workshop prefix code used for Naming. (3 characters)."
  type        = string
  default     = "VPC"
  validation {
    condition     = contains(["VPC"], var.prefixvpc)
    error_message = "The current support value is VPC."
  }
}

variable "prefixsubnet" {
  description = "(Optional) TF ACN Workshop prefix code used for Naming. (3 characters)."
  type        = string
  default     = "SUBNET"
  validation {
    condition     = contains(["SUBNET"], var.prefixsubnet)
    error_message = "The current support value is SUBNET."
  }
}

variable "environment" {
  description = "(Required) TF ACN Workshop environment code used for Naming. (3 characters) "
  type        = string
  validation {
    condition     = contains(["workshop"], var.environment)
    error_message = "The current support values is workshop."
  }
}

variable "purpose" {
  description = "(Required) Tagging for purpose of the VPC/Subnet."
  type        = string
}

variable "number_of_sequence" {
  description = "(Required) number_of_sequence number of the resource. If you have more than one resource, send the number_of_sequence accordingly so that names dont clash."
  type        = number
}

//VPC
variable "vpcCDIRblock" {
  description = "CDIR blocks to associate with the VPC to extend the IP Address pool"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instanceTenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "dnsSupport" {
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults true."
  type        = bool
  default     = true
}

variable "dnsHostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false."
  type        = bool
  default     = true
}

//PUBLIC SUBNETS
variable "publicCDIRblock_a" {
  description = "CDIR blocks to associate with the subnet to extend the IP Address pool"
  type        = string
  default     = "10.0.3.0/24"
}

variable "publicCDIRblock_b" {
  description = "CDIR blocks to associate with the subnet to extend the IP Address pool"
  type        = string
  default     = "10.0.4.0/24"
}

variable "mapPublicIP" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false"
  type        = bool
  default     = false
}

//PRIVATE SUBNETS
variable "privateCDIRblock_a" {
  description = "CDIR blocks to associate with the subnet to extend the IP Address pool"
  type        = string
  default     = "10.0.1.0/24"
}

variable "privateCDIRblock_b" {
  description = "CDIR blocks to associate with the subnet to extend the IP Address pool"
  type        = string
  default     = "10.0.2.0/24"
}

//SUBNET GENERAL PARAMETERS
variable "availabilityZone" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false"
  type        = list(string)
  default     = ["us-east-1a","us-east-1c"]
}