#!/bin/bash
sudo yum update -y
sudo yum install amazon-ssm-agent -y
sudo yum install -y amazon-cloudwatch-agent
sudo yum install -y amazon-cloudwatch-agent
sudo yum install -y net-tools
sudo yum install -y git
sudo yum install -y telnet
sudo systemctl enable amazon-ssm-agent
sudo systemctl restart amazon-ssm-agent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a start
sudo touch /root/elson.txt
