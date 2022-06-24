resource "aws_vpc" "vpc_treinamento"{
    cidr_block           = var.vpcCDIRblock
    instance_tenancy     = var.instanceTenancy
    enable_dns_support   = var.dnsSupport
    enable_dns_hostnames = var.dnsHostnames

    tags = {
        "Name"             = "${local.namingvpc}",
        "Environment"      = "${var.environment}"
  }
}
