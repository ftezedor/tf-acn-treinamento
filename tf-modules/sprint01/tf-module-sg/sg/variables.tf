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
variable "prefix" {
  description = "(Optional) TF ACN Workshop prefix code used for Naming. (3 characters)."
  type        = string
  default     = "tf"
  /* validation {
    condition     = contains(["tf"], var.prefix)
    error_message = "The current support value is tf."
  } */
}

variable "environment" {
  description = "(Required) TF ACN Workshop environment code used for Naming. (3 characters) "
  type        = string
  /* validation {
    condition     = contains(["feature", "hotfix", "master"], var.environment)
    error_message = "The current support values are feature, hotfix, and master."
  } */
}

variable "purpose" {
  description = "(Required) Tagging for purpose of the Security Group."
  type        = string
}

variable "number_of_sequence" {
  description = "(Required) number_of_sequence number of the resource. If you have more than one resource, send the number_of_sequence accordingly so that names dont clash."
  type        = number
}

// SECURITY GROUP
variable "vpc_cidr_block" {
  description = "(Required) AWS VPC CIDR Block."
  type        = string
}

variable "allowed_ports" {
  description = "(Required) Ports allowed to security group."
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = null
}
