############################################# LUCAS OMENA #############################################

// ACCOUNT PROVIDER
region  = "us-east-1"
role_arn = "arn:aws:iam::251589962883:role/tf-acn-assume-role"

// NETWORKING
vpc_cidr_block = "10.100.0.0/16"

// NAMING
prefix             = "tf"
environment        = "dev"
number_of_sequence = 1

// TAGGING
cost_tags = {
  "bussiness-unit" = "ACN"
  "department"     = "IC"
  "company"        = "Accenture"
  "purpose"        = "Terraform Workshop"
}

// EC2
ec2_os           = "l"
root_volume_type = "gp3"
root_volume_size = 8
amis = {
  "linux"   = "ami-0022f774911c1d690"
  "windows" = "ami-033594f8862b03bb2"
}
instance_type = {
  "us-east-1" = "t3.medium"
  "us-east-2" = "m5.large"
  "sa-east-1" = "m5.large"
}
// WINDOWS USER DATA
# user_data = <<EOF
#<powershell>
#</powershell>
# EOF

// LINUX USER DATA
user_data = <<EOF
#!/bin/bash
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install jenkins -y
sudo systemctl start jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
EOF

// SECURITY GROUP
allowed_ports = [{
  description = "Allow SSH"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0",
    "172.71.6.52/32"
  ]
  },
  {
    description = "Allow RDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0",
      "172.71.6.52/32"
    ]
  },
  {
    description = "Allow Jenkins Port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0",
      "172.71.6.52/32"
    ]
  },
  {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0",
      "172.71.6.52/32"
    ]
}]
