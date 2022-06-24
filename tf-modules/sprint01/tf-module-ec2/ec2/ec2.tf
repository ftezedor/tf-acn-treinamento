resource "aws_instance" "ec2_windows" {
  count = var.ec2_os == "w" ? var.counter : 0

  ami                    = lookup(var.amis, var.region)
  instance_type          = var.instance_type
  iam_instance_profile   = var.iam_instance_profile != "" ? var.iam_instance_profile : null
  get_password_data      = var.get_password_data
  key_name               = var.key_name
  subnet_id              = data.aws_subnet.subnet.id
  vpc_security_group_ids = data.aws_security_group.sg[*].id
  #availability_zone           = data.aws_availability_zones.azs.names[0]
  associate_public_ip_address = true
  private_ip                  = length(var.private_ip) > 0 ? element(var.private_ip, count.index) : null
  monitoring                  = true
  tenancy                     = var.tenancy
  disable_api_termination     = true

  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size == "" ? 8 : var.root_volume_size
    iops                  = var.root_volume_type == "io1" ? var.root_iops : 0
    delete_on_termination = true
    encrypted             = true
    #kms_key_id            = var.kms_key_arn
  }

  user_data = var.user_data
  tags = {
    "Name"             = "${local.naming}",
    "Environment"      = "${var.environment}",
    "Operating System" = var.ec2_os == "w" ? "Windows" : "Linux"
  }
  volume_tags = {
    "Name"             = join("", [local.naming, "-root-volume"]),
    "Environment"      = "${var.environment}",
    "Operating System" = var.ec2_os == "w" ? "Windows" : "Linux"
  }

  depends_on = [
    data.aws_vpc.vpc,
    data.aws_subnet.subnet,
    data.aws_security_group.sg,
    #data.aws_kms_key.kms_key
  ]
}

resource "aws_instance" "ec2_linux" {
  count = var.ec2_os == "l" ? 1 : 0

  ami                  = var.ami
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_instance_profile != "" ? var.iam_instance_profile : null
  key_name             = var.key_name

  subnet_id              = data.aws_subnet.subnet.id
  vpc_security_group_ids = data.aws_security_group.sg[*].id
  #availability_zone           = data.aws_availability_zones.azs.names[0]
  associate_public_ip_address = true

  private_ip              = length(var.private_ip) > 0 ? element(var.private_ip, count.index) : null
  monitoring              = true
  tenancy                 = var.tenancy
  disable_api_termination = var.environment == "dev" ? false : true

  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size == "" ? 8 : var.root_volume_size
    iops                  = var.root_volume_type == "io1" ? var.root_iops : 0
    delete_on_termination = true
    encrypted             = true
    #kms_key_id            = var.kms_key_arn
  }

  user_data = var.user_data
  tags = {
    "Name"             = "${local.naming}",
    "Environment"      = "${var.environment}",
    "Operating System" = var.ec2_os == "w" ? "Windows" : "Linux"
  }
  volume_tags = {
    "Name"             = join("", [local.naming, "-root-volume"]),
    "Environment"      = "${var.environment}",
    "Operating System" = var.ec2_os == "w" ? "Windows" : "Linux"
  }

  depends_on = [
    data.aws_vpc.vpc,
    data.aws_subnet.subnet,
    data.aws_security_group.sg,
    #data.aws_kms_key.kms_key
  ]
}