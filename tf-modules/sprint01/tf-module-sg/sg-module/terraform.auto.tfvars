// AWS ACCOUNT VARIABLES
region                  = "us-east-1"
profile                 = "tf-acn-workshop"

// TAGGING
prefix                       = "tf"
environment                  = "workshop"
purpose                      = "acn"
number_of_sequence = 1

// SECURITY GROUP
vpc_cidr_block = "172.31.0.0/16"

allowed_ports = [{
  description = "Allow SSH"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}]
