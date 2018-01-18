#/bin/sh


ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory/example $1 playbook.yml
