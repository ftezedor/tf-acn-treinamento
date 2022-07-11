############################################# TERRAFORM #############################################

# Terraform Providers são plugins utilizados para interagir e se conectar com sistemas remotos
# https://registry.terraform.io/providers/hashicorp/aws/latest

############################################# TERRAFORM #############################################
/* terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    assume_role {
      role_arn = "arn:aws:iam::600908795746:role/tf-acn-role"
    }
} */

/*
Criar IAM Role 

Com policy de administratorFullAccess
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowAllPermissions",
            "Effect": "Allow",
            "NotAction": [
                "lightsail:*",
                "sagemaker:*"
            ],
            "Resource": "*"
        }
    ]
}

Em seguida, atribuir uma Inline policy para Assume Role
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "arn:aws:iam::600908795746:role/tf-acn-role"
        }
    ]
}



aws sts assume-role --role-arn arn:aws:iam::600908795746:role/tf-acn-role --role-session-name "tf-acn-treinamento-session" --profile tf-acn-treinamento --output json
export AWS_ACCESS_KEY_ID=ASIAYX2HUR5REKSWXB6B
export AWS_SECRET_ACCESS_KEY=GdpY3miqJvRmvSs1vSbEEzaGjl2NBGuF48k2q4ba
export AWS_SESSION_TOKEN=IQoJb3JpZ2luX2VjEBcaCXVzLWVhc3QtMSJHMEUCIQCR0Egllqg9Puw/yHQw36ZlVqouAzZelCQwHQgTplUn3QIgGuniOXhM8PB1FZklPIB9lFSIxyOiOgusLsT7tXv8M7MqpwIIUBABGgw2MDA5MDg3OTU3NDYiDMYsHQ9U7PpBZ0N9bSqEAlLsQ5tR/zsmzQG9a1t07Y7+2VnWuETSQwPKE7E0tCVp2g/04+r54ZEMgZu8lxuMMxOHTBu2/f+EM2YtjHiZr1z1oMpDRnvfUyFW/YIu95t3usTdJZ02R02CX7p8a5U3rGj78YYTqnG6S2R2CSqPSq9PmIdomANuO+0bXBtKRpdXP3zJVK5OGjQCCWYSTu0WMcyEqwcSvFzcJlRBOjWjThwuW892gZpu3l8dyzXm+c9iZ4UP8wMGGmOFVDa1AViqWTILAABiMWKqAuFrdGzyKt78vseCqT2SL0uaSFOZQ5jPaPdbav6A+ApSRkxwId/j3iUODOzjoxIMnUnkFRwEfTgy15yzMMnMspYGOp0BwA0hwfz3rqcEUAtYlgWcvCAhYbMhbbpcjL9bF0rp/CYDy8okCe0VLEeGmTJEIa/5yxG99Eqvq5isyJmP9dB8YrxgiZfHinN3hHgJC7SerPN2YaqKEQjlTHi81eZcy7oqRMaaUbTlGHQgSxkQS2mTvveFVdLYqM8aGGdDya0wqMQ0PxH45CE7YMT+qeOviyCGP8FjaGYFpDLGkgnPtQ==

===

aws_credentials=$(aws sts assume-role --role-arn arn:aws:iam::838734154092:role/tf-acn-assume-role --role-session-name "tf-acn-treinamento-session" --profile tf-acn-treinamento --output json)

export AWS_ACCESS_KEY_ID=$(echo $aws_credentials|jq '.Credentials.AccessKeyId'|tr -d '"')
export AWS_SECRET_ACCESS_KEY=$(echo $aws_credentials|jq '.Credentials.SecretAccessKey'|tr -d '"')
export AWS_SESSION_TOKEN=$(echo $aws_credentials|jq '.Credentials.SessionToken'|tr -d '"')
*/