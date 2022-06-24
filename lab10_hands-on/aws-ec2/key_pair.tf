/*
ssh-keygen -t ed25519 -C "ec2-user" -f ~/.ssh/tf-acn-workshop -N ''
*/

resource "aws_key_pair" "key_pair" {
  key_name   = "tf-acn-workshop"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILH8VweZauCXgguBNUTTpLXNQiez7MvC7UNqZmrvu/MP ec2-user"
}