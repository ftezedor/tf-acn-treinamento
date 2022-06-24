resource "aws_subnet" "public_subnet_a" {
    vpc_id                  = aws_vpc.vpc_treinamento.id
    cidr_block              = var.publicCDIRblock_a
    map_public_ip_on_launch = var.mapPublicIP
    availability_zone       = var.availabilityZone[0]

    tags = {
        "Name"             = "${local.namingsubnet}",
        "Environment"      = "${var.environment}"
  }
}

resource "aws_subnet" "public_subnet_b" {
    vpc_id                  = aws_vpc.vpc_treinamento.id
    cidr_block              = var.publicCDIRblock_b
    map_public_ip_on_launch = var.mapPublicIP
    availability_zone       = var.availabilityZone[1]

    tags = {
        "Name"             = "${local.namingsubnet}",
        "Environment"      = "${var.environment}"
  }
}

resource "aws_subnet" "private_subnet_a" {
    vpc_id            = aws_vpc.vpc_treinamento.id
    cidr_block        = var.privateCDIRblock_a
    availability_zone = var.availabilityZone[0]

    tags = {
        "Name"             = "${local.namingsubnet}",
        "Environment"      = "${var.environment}"
  }
}

resource "aws_subnet" "private_subnet_b" {
    vpc_id            = aws_vpc.vpc_treinamento.id
    cidr_block        = var.privateCDIRblock_b
    availability_zone = var.availabilityZone[1]

    tags = {
        "Name"             = "${local.namingsubnet}",
        "Environment"      = "${var.environment}"
  }
}