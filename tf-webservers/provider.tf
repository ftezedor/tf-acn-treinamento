############################################# TERRAFORM #############################################

/*
1) Create Terraform Organization
2) Create Terraform Workspace
3) Run the command terraform login
4) Generate the API token from Web Browser
*/

/*
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AssumeRoleTerraform",
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "arn:aws:iam::697538654983:role/tf-acn-assume-role"
        }
    ]
}

aws_credentials=$(aws sts assume-role --role-arn arn:aws:iam::697538654983:role/tf-acn-assume-role --role-session-name "tf-acn-workshop-session" --profile tf-acn-workshop --output json)

export AWS_ACCESS_KEY_ID=$(echo $aws_credentials|jq '.Credentials.AccessKeyId'|tr -d '"')
export AWS_SECRET_ACCESS_KEY=$(echo $aws_credentials|jq '.Credentials.SecretAccessKey'|tr -d '"')
export AWS_SESSION_TOKEN=$(echo $aws_credentials|jq '.Credentials.SessionToken'|tr -d '"')

*/

############################################# TERRAFORM #############################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}
