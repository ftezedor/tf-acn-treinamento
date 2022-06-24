// AWS ACCOUNT VARIABLES
region  = "us-east-1"
profile = "tf-acn-workshop"

// NETWORKING
vpc_id             = "vpc-0f0b993e45f9c1e24"
subnet_id          = "subnet-03641a3331a185223"
security_group_ids = ["sg-0cd440fb5bc279aa1"]

// EBS 
root_volume_type = "gp3"
root_volume_size = 8
ebs_block_device = [{
  device_name = "/dev/sdf"
  volume_type = "gp3"
  volume_size = 10
  // IOPS MAX = 50 IOPS x GB
  iops = 500
}]
//kms_key_arn = ""

// EC2
counter              = 2
iam_instance_profile = "ec2instancerole"
instance_type        = "t2.micro"
ami = {
  "us-east-1" = "ami-0022f774911c1d690"
}
//ami_owner  = "self"
private_ip = ["172.31.0.12"]
key_name   = "tf-acn-workshop"
ec2_os     = "l"

// WINDOWS USER DATA
# user_data = <<EOF
#<powershell>
#Invoke-WebRequest https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/windows_amd64/AmazonSSMAgentSetup.exe -OutFile $env:USERPROFILE\Desktop\SSMAgent_latest.exe
#Start-Process -FilePath $env:USERPROFILE\Desktop\SSMAgent_latest.exe -ArgumentList "/S"
#rm -Force $env:USERPROFILE\Desktop\SSMAgent_latest.exe
#Restart-Service AmazonSSMAgent
#</powershell>
# EOF

// LINUX USER DATA
user_data = <<EOF
#!/bin/bash
sudo yum install -y https://s3.region.amazonaws.com/amazon-ssm-region/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl status amazon-ssm-agent
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent
sudo systemctl status amazon-ssm-agent
EOF

/* user_data = <<EOF
#!/bin/bash
yum install httpd -y
/sbin/chkconfig --levels 235 httpd on
service httpd start
instanceId=$(curl http://169.254.169.254/latest/meta-data/instance-id)
echo "<h1>$instanceId</h1>" > /var/www/html/index.html
EOF */

// TAGGING
prefix             = "tf"
purpose            = "acn"
environment        = "workshop"
number_of_sequence = 1
