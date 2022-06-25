############################################# LUCAS OMENA #############################################

# Terraform Providers são plugins utilizados para interagir e se conectar com sistemas remotos
# https://registry.terraform.io/providers/hashicorp/aws/latest

#######################################################################################################
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

/*

 aws sts assume-role --role-arn arn:aws:iam::838734154092:role/tf-acn-assume-role --role-session-name "tf-acn-assume-role-session" --profile tf-acn-workshop --output json


{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "tf-acn-assume-role",
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "arn:aws:iam::838734154092:role/tf-acn-assume-role"
        }
    ]
}
*/

provider "aws" {
    region = "us-east-1"
    assume_role {
      role_arn = "arn:aws:iam::902287633309:role/tf-acn-assume-role"
      session_name = "tf-acn-assume-role-session"
    }
}