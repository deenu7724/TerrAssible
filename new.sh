#!/bin/sh
cd /home/ec2-user/terraform_lab
terraform init
terraform plan
terraform apply -auto-approve

var=$(terraform output instance-public-ip)

echo "hello" + $var

ansible -m ping all -i "$var," --private-key=keyfile

ansible-playbook apache2.yml -i "ip," --private-key=keyfile -e "ansible_python_interpreter=/usr/bin/python3"
