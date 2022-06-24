############################################# LUCAS OMENA #############################################

# Provides a S3 bucket resource
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

#######################################################################################################

resource "aws_s3_bucket" "buckets" {
  bucket = "my-tf-test-bucket-20220516"

  tags = {
    Environment = "Dev"
  }
}
