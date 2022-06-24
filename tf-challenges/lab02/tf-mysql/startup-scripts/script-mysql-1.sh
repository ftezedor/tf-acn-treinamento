#!/bin/bash
yum update -y
yum install -y mysql-wsrep-5.7 galera-3 
systemctl start mysqld 

