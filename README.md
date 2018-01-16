# Ansible_presentation

Introduction to Ansible with an example using Vagrant + VirtualBox + Ansible.

The slide show uses [remark.js](https://github.com/gnab/remark). Just open
`presenstation/index.html` in your browser.

The example uses Vagrant to bring up the machines, but provisioning is
decoupled to illustrate how to run Ansible on any existing machines.

# Content

* `presentation/*`: The slides, done in remark.js.
* `Vagrantfile`: Vagrant machine definitions to bring up the VMs.

# VMs

## client-int

* **Type**: debian-8-amd64-xfce
* **Private IP**: 192.168.50.2
* **Memory**: 1024MB

## client-ext

* **Type:** debian-8-amd64-xfce
* **Private IP**: 192.168.50.3
* **Memory**: 1024,

## server-web

* **Type:** debian-stretch-amd64
* **Private IP**: 192.168.50.4
* **Memory**: 512MB

## router-fw

* **Type:** juniper-ffp-12.1X47-D15.4-packetmode
* **Private IP**: 192.168.50.5
* **CPUs**: 2 (Important)

# Live demo requirements

## Vagrant

To bring up the machines Vagrant and VirtualBox is used. Vagrant needs the
following plug-ins for the demonstration:

    * hostmanager
    * junos
    * host-shell

To install these run:

    vagrant plugin install vagrant-hostmanager
    vagrant plugin install vagrant-junos
    vagrant plugin install vagrant-host-shell