############################################# TERRAFORM #############################################

# Terraform Providers são plugins utilizados para interagir e se conectar com sistemas remotos
# https://registry.terraform.io/providers/hashicorp/aws/latest

############################################# TERRAFORM #############################################
terraform {
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
      role_arn = "arn:aws:iam::043525666653:role/qualquercoisa"
    }
}

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
            "Resource": "arn:aws:iam::043525666653:role/qualquercoisa"
        }
    ]
}



aws sts assume-role --role-arn arn:aws:iam::043525666653:role/qualquercoisa --role-session-name "tf-acn-treinamento-session" --profile tf-acn-treinamento --output json
export AWS_ACCESS_KEY_ID=ASIAQUISU65O3VQVRM3P
export AWS_SECRET_ACCESS_KEY=MSw76nmi61syXpGajzNUsX1RD8OhEBnqER/Rlagr
export AWS_SESSION_TOKEN=IQoJb3JpZ2luX2VjEG8aCXVzLWVhc3QtMSJIMEYCIQCFH5w0kARpirYVfon84ncRfhcnGsr7F/ZfLRxRDIP0owIhAJj73SgGDDuyIbz/HZZNrIDIx5oMUPnXamRevoXIf/9MKrACCJj//////////wEQARoMMDQzNTI1NjY2NjUzIgyoe1LXMer/j3W1W4AqhAL9f4gFExZ+Ar3CC//TdbmE7I2PflMqRYBLOzBIeIvo70yussQcxGdq4G5lkG/snuFYqzIhamC9ST/TJNhRQkepv+BWV/mHALKRiy8t6daZVbTz7LaRTlY47mqlib6O2eK3hFRgirL7tiaj3fhrFOaAWm8S55GAJQfNjB/pjdye+G7NoqsMlFoZrKj131RFn87j9CfLHIjOYuASWwYDOayNWt+9mB3DmIVbrPiK9nrH8DJ8ssRnkJ4uVcbKfHyxRYmnY/32HIARjXDYnfDVjULfUWZVSghnpWTcwjHOFQdMyV2hbGRFoH/1wPbwIF4TzBCVLDLCoU2EM8iQbWda7KEhstTjsTCL142WBjqcAeWgYIb1KjJfQqNd+5tbEka8mAlN0Rwdrbn0H/ad8/X4umCzmcOEKc5qSHaz7hlQNrx3r8a2qwgxnY/BWKB+N45nwBod3JJeWMqVxuRd/UNiNotvsCMWqAiGf7QRb9sMHW8OBi8iartQuOVrj+MDciHKLXzM8HF0EyupNOvFFvWC4IkYFySy0lJa/fZCZupUOhRFNygO0Ocm6LfmjA==

===

aws_credentials=$(aws sts assume-role --role-arn arn:aws:iam::838734154092:role/tf-acn-assume-role --role-session-name "tf-acn-treinamento-session" --profile tf-acn-treinamento --output json)

export AWS_ACCESS_KEY_ID=$(echo $aws_credentials|jq '.Credentials.AccessKeyId'|tr -d '"')
export AWS_SECRET_ACCESS_KEY=$(echo $aws_credentials|jq '.Credentials.SecretAccessKey'|tr -d '"')
export AWS_SESSION_TOKEN=$(echo $aws_credentials|jq '.Credentials.SessionToken'|tr -d '"')
*/