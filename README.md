# Ansible_presentation

Introduction to Ansible with an example using Vagrant + VirtualBox + Ansible.

The [slide show](https://deadbok.github.io/ansible_presentation/) uses [remark.js](https://github.com/gnab/remark). Just open
`presenstation/index.html` in your browser or navigate to [https://github.com/deadbok/ansible_presentation](https://github.com/deadbok/ansible_presentation).

The example uses Vagrant to bring up the machines, but provisioning is
decoupled to illustrate how to run Ansible on any existing machines.

# Content

* `docs/*`: The slides, done in remark.js.
* `Vagrantfile`: Vagrant machine definitions to bring up the VMs.

# VMs

## client-int

Desktop machine inside the private network.

* **Type**: debian-8-amd64-xfce
* **Private IP**: 192.168.50.2
* **Memory**: 1024MB

## client-ext

Desktop machine outside the private network.

* **Type:** debian-8-amd64-xfce
* **Private IP**: 192.168.50.3
* **Memory**: 1024MB

## server-web

Web server inside the private network.

* **Type:** debian-stretch-amd64
* **Private IP**: 192.168.50.4
* **Memory**: 512MB

## router-fw

Router that sits between the external and the internal network.

* **Type:** juniper-ffp-12.1X47-D15.4-packetmode
* **Private IP**: 192.168.50.5
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
