Vagrant multi-machine SHRINE 2-node test network
================================================

Prerequisites
-------------

- VirtualBox 4.x or 5.x
- Vagrant >= 2.0.x
- git
- rsync
- (optional) Ansible >= 2.2.x

Provisioning
------------

1. Install required Ansible roles:

   # if you have Ansible installed
   $ ansible-galaxy install -f -p roles -r requirements.yml
   # if you don't have Ansible installed
   $ sh requirements.sh

2. (optional) Customize node configurations by editing Ansible variables files:

   extra_vars.yml
   group_vars/...
   host_vars/...

3. Start the machines and provision them:

   $ vagrant up

Accessing the SHRINE web client
-------------------------------

SHRINE Hub: https://localhost:6443/shrine-webclient
SHRINE Node1: https://localhost:6444/shrine-webclient

Accessing the i2b2 Web Client / Admin Console
-------------------------------

i2b2 Hub: http://localhost:8080/webclient or http://localhost:8080/admin
i2b2 Node1: http://localhost:8080/webclient or http://localhost:8080/admin

Re-provisioning
---------------

1. Make necessary changes to Ansible roles and/or variables files.  If changes
   were made to external Ansible roles, re-install them (see Provisioning step
   1 above). 

2. Re-synchronize folder to Vagrant boxes

   $ vagrant rsync

3. Re-provision

   $ vagrant provision || vagrant up --provision
