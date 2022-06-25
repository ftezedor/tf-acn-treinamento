############################################# TERRAFORM #############################################

# Provides a S3 bucket resource
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

############################################# TERRAFORM #############################################

resource "random_string" "suffix" {
  length           = 5
  special          = false
}

resource "aws_s3_bucket" "buckets" {
  bucket = "my-tf-test-bucket-${random_string.suffix.result}"

  tags = {
    Environment = "Dev"
  }
}
