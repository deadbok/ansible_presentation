# Ansible_presentation

Introduction to Ansible with an example using Vagrant + VirtualBox + Ansible.

The [slide show](https://deadbok.github.io/ansible_presentation/) uses [remark.js](https://github.com/gnab/remark). Just open
`presenstation/index.html` in your browser or navigate to:

* **English**: [https://deadbok.github.io/ansible_presentation/](https://deadbok.github.io/ansible_presentation/)
* **Danish**: [https://deadbok.github.io/ansible_presentation/index-da.html](https://deadbok.github.io/ansible_presentation/index-da.html)

The example uses Vagrant to bring up the machines, but provisioning is
decoupled to illustrate how to run Ansible on any existing machines.

The example is a private network with a Juniper vSRX abused as a DNS proxy,
making a web server available at `web.example.com` in a Debian client running
the XFCE desktop. The webserver, DNS proxy config, timezone, and resolver
configuration is all done using Ansible.

# Content

* [docs/*](./docs): The slides, done in remark.js.
* [inventory/*](./inventory): Ansible inventory.
* [rendered/*](./rendered): Rendered configuration templates for JunOS devices.
* [roles/*](./roles): Ansible Roles.
* [deploy.sh](./deploy.sh): Script to run Ansible on the VMs
* [playbook.yml](./playbook.yml): Ansible example playbook.
* [Vagrantfile](./Vagrantfile): Vagrant machine definitions to bring up the VMs.


# Running

To create the VMs for the example run this command from the root of the
project:

    vagrant up

Then to deploy the software and settings using Ansible run:

    ./deploy.sh

# VMs

## client-int

Desktop machine to test the DNS and web server.

* **Type**: debian-8-amd64-xfce
* **Private IP**: 192.168.50.4
* **Memory**: 1024MB

## server-web

Web server.

* **Type:** debian-stretch-amd64
* **Private IP**: 192.168.50.3
* **Memory**: 512MB

## router-fw

Juniper router abused as a DNS proxy.

* **Type:** juniper-ffp-12.1X47-D15.4-packetmode
* **Private IP**: 192.168.50.2
* **Memory**: 512MB
* **CPUs**: 2 (Important)

# Live demo requirements

## Vagrant

Vagrant and VirtualBox is used to bring up the virtual machines. Vagrant needs
the following plug-ins for the demonstration:

* hostmanager
* junos
* host-shell

To install these run:

    vagrant plugin install vagrant-hostmanager
    vagrant plugin install vagrant-junos
    vagrant plugin install vagrant-host-shell

## Ansible

Ansible needs the JunOS module to control the vSRX in the network. To install
the module run:

    pip3 install jxmlease
    pip3 install junos-eznc
    ansible-galaxy install Juniper.junos

Depending on your default Python version and distribution you might need to use
`pip` (for Python 2) instead of `pip3`.
