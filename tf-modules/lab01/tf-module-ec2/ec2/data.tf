// DATA
data "aws_availability_zones" "azs" {
  state = "available"
}

data "aws_instance" "instance_linux" {
  count       = var.ec2_os == "l" ? 1 : 0
  instance_id = join("", aws_instance.ec2_linux[*].id)
  depends_on = [
    aws_instance.ec2_linux
  ]
}

data "aws_instance" "instance_windows" {
  count       = var.ec2_os == "w" ? 1 : 0
  instance_id = join("", aws_instance.ec2_windows[*].id)
  depends_on = [
    aws_instance.ec2_windows
  ]
}

# data "aws_kms_key" "kms_key" {
#   depends_on = [var.kms_key_arn]
#   key_id     = var.kms_key_arn
# }

data "aws_vpc" "vpc" {
  id = var.vpc_id
}

data "aws_subnet" "subnet" {
  id = var.subnet_id
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_security_group" "sg" {
  count = length(var.security_group_ids)
  id    = var.security_group_ids[count.index]
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_caller_identity" "current" {}
