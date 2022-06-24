############################################# LUCAS OMENA #############################################

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_instance" "ec2_windows" {
  count = var.ec2_os == "w" ? var.counter : 0

  ami                  = lookup(var.amis, var.ec2_os == "w" ? "windows" : "linux")
  instance_type        = lookup(var.instance_type, var.region, "t3.micro")
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  get_password_data = random_password.password.result
  key_name          = aws_key_pair.key_pair.key_name

  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]

  associate_public_ip_address = true
  monitoring                  = false
  disable_api_termination     = var.environment == "dev" ? false : true

  root_block_device {
    volume_type           = var.root_volume_type
    iops                  = var.root_volume_type == "io1" ? var.root_iops : 0
    volume_size           = var.root_volume_size == "" ? 8 : var.root_volume_size
    delete_on_termination = true
    encrypted             = true
  }

  user_data = var.user_data

  tags = {
    "Name"             = join("-", [lower(var.prefix), "ec2", lower(var.environment), format("%02d", var.number_of_sequence)])
    "Environment"      = var.environment
    "Operating System" = var.ec2_os == "w" ? "Windows" : "Linux"
  }
  volume_tags = {
    "Name"             = join("-", [lower(var.prefix), "ec2", lower(var.environment), "root-volume"])
    "Environment"      = var.environment
    "Operating System" = var.ec2_os == "w" ? "Windows" : "Linux"
  }

  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public_subnet,
    aws_subnet.private_subnet,
    aws_security_group.sg
  ]
}

resource "aws_instance" "ec2_linux" {
  count = var.ec2_os == "l" ? 1 : 0

  ami                  = lookup(var.amis, var.ec2_os == "l" ? "linux" : "windows")
  instance_type        = lookup(var.instance_type, var.region, "t3.micro")
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  key_name             = aws_key_pair.key_pair.key_name

  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]

  associate_public_ip_address = true
  monitoring                  = true
  disable_api_termination     = var.environment == "dev" ? false : true

  root_block_device {
    volume_type           = var.root_volume_type
    iops                  = var.root_volume_type == "io1" ? var.root_iops : 0
    volume_size           = var.root_volume_size == "" ? 8 : var.root_volume_size
    delete_on_termination = true
    encrypted             = true
  }

  user_data = var.user_data
  tags = {
    "Name"             = join("-", [lower(var.prefix), "ec2", lower(var.environment), format("%02d", var.number_of_sequence)])
    "Environment"      = var.environment
    "Operating System" = var.ec2_os == "w" ? "Windows" : "Linux"
  }
  volume_tags = {
    "Name"             = join("-", [lower(var.prefix), "ec2", lower(var.environment), "root-volume"])
    "Operating System" = var.ec2_os == "w" ? "Windows" : "Linux"
  }

  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public_subnet,
    aws_subnet.private_subnet,
    aws_security_group.sg
  ]
}
