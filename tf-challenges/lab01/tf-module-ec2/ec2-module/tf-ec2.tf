############################################# LUCAS OMENA #############################################

# Módulos são containers com múltiplos recursos que podem ser usados juntos.
# https://www.terraform.io/language/modules

#######################################################################################################

module "ec2" {
  source = "../ec2"

  // AWS ACCOUNT VARIABLES
  region                  = var.region
  profile                 = var.profile

  // NETWORKING
  vpc_id             = var.vpc_id
  subnet_id          = var.subnet_id
  security_group_ids = var.security_group_ids

  // EBS 
  root_volume_type = var.root_volume_type
  root_volume_size = var.root_volume_size
  ebs_block_device = var.ebs_block_device

  // EC2
  iam_instance_profile = var.iam_instance_profile
  instance_type        = var.instance_type
  ami                  = var.ami
  ami_owner            = var.ami_owner
  private_ip           = var.private_ip
  key_name             = var.key_name
  ec2_os               = var.ec2_os

  // USER DATA
  user_data = var.user_data

  // TAGGING
  prefix             = var.prefix
  environment        = var.environment
  purpose            = var.purpose
  number_of_sequence = var.number_of_sequence
}
