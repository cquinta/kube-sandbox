#!/bin/sh
sudo apt -y update
sudo apt -y install software-properties-common
sudo apt-add-repository --yes ppa:ansible/ansible
sudo apt-get -y update
sudo apt -y install ansible
sudo apt-get install -y sshpass
export ANSIBLE_HOST_KEY_CHECKING=False
ansible cluster -m ping -i ~/ansible/inventory
ansible-playbook ~/ansible/playbooks/site.yaml -i ~/ansible/inventory
