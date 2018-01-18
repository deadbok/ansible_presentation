### webserver

Ansible role to deploy a webserver performing the following tasks:

 * Update packages.
 * Install apache2
 * Install ufw
 * Install open-vm-tools
 * Install the Midnight Commander
 * Instlal the nano editor
 * Close all ports except 22, 80 using ufw

The Ansible role will clone the website at https://bitbucket.org/badasspngroup/website
onto the web server when run.
