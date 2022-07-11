resource "aws_vpc" "minha_primeira_vpc" {
  cidr_block = "10.0.0.0/24"
  enable_dns_support = true
}