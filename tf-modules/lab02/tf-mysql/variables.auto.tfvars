############################################# LUCAS OMENA #############################################

// ACCOUNT PROVIDER
region   = "us-east-1"
role_arn = "arn:aws:iam::859878781163:role/tf-acn-assume-role"

// NETWORKING
vpc_cidr_block = "10.200.0.0/16"

// NAMING
prefix             = "galera"
environment        = "dev"
number_of_sequence = 1
counter            = 2

// TAGGING
cost_tags = {
  "bussiness-unit" = "ACN"
  "department"     = "IC"
  "company"        = "Accenture"
  "purpose"        = "Terraform Workshop"
}

// EC2
ec2_os           = "l"
root_volume_type = "gp3"
root_volume_size = 8
operating_system = "amazon-linux"
amis = {
  "amazon-linux"   = "ami-0022f774911c1d690"
  "centos"         = "ami-02358d9f5245918a3"
  "ubuntu"         = "ami-005de95e8ff495156"
  "redhat"         = "ami-0f095f89ae15be883"
  "macos"          = "ami-025e8ae92c7b6ff27"
}
instance_type = {
  "us-east-1" = "t3.medium"
  "us-east-2" = "m5.large"
  "sa-east-1" = "m5.large"
}

// WINDOWS USER DATA
# user_data = <<EOF
#<powershell>
#</powershell>
# EOF

// LINUX USER DATA
#user_data = <<EOF
##!/bin/bash

// SECURITY GROUP
allowed_ports = [{
  description = "Allow SSH"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  },
  {
    description = "Allow RDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  },
  {
    description = "Allow MySQL Port"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  },
  {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
}]
