VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "i2b2-hub" do |i2b2|
    i2b2.vm.box = "harvardcatalyst/i2b2-1708b"
    i2b2.vm.box_version = "0.0.1"
    i2b2.vm.provision "shell", inline: "yum -y install epel-release && yum -y install ansible"
    i2b2.vm.provision "ansible_local" do |ansible|
      ansible.inventory_path = "hosts"
      ansible.limit = "i2b2-hub"
      ansible.playbook = "i2b2.yml"
      ansible.become = true
      ansible.extra_vars = "extra_vars.yml"
      ansible.verbose = "v"
    end
    i2b2.vm.network "private_network", ip: "172.28.128.3"
    i2b2.vm.network "forwarded_port", guest: 80, host: 9080, host_ip: "127.0.0.1"
    i2b2.vm.network "forwarded_port", guest: 9090, host: 9090, host_ip: "127.0.0.1"
  end
  config.vm.define "shrine-hub" do |shrine|
    shrine.vm.box = "harvardcatalyst/centos-7-core"
    shrine.vm.box_version = "0.0.4"
    shrine.vm.provision "shell", inline: "yum -y install epel-release && yum -y install ansible"
    shrine.vm.provision "ansible_local" do |ansible|
      ansible.inventory_path = "hosts"
      ansible.limit = "shrine-hub"
      ansible.playbook = "shrine.yml"
      ansible.become = true
      ansible.extra_vars = "extra_vars.yml"
      ansible.verbose = "v"
    end
    shrine.vm.network "private_network", ip: "172.28.128.4"
    shrine.vm.network "forwarded_port", guest: 6060, host: 6060, host_ip: "127.0.0.1"
    shrine.vm.network "forwarded_port", guest: 6443, host: 6443, host_ip: "127.0.0.1"
  end
  config.vm.define "i2b2-node1" do |i2b2|
    i2b2.vm.box = "harvardcatalyst/i2b2-1708b"
    i2b2.vm.box_version = "0.0.1"
    i2b2.vm.provision "shell", inline: "yum -y install epel-release && yum -y install ansible"
    i2b2.vm.provision "ansible_local" do |ansible|
      ansible.inventory_path = "hosts"
      ansible.limit = "i2b2-node1"
      ansible.playbook = "i2b2.yml"
      ansible.become = true
      ansible.extra_vars = "extra_vars.yml"
      ansible.verbose = "v"
    end
    i2b2.vm.network "private_network", ip: "172.28.128.5"
    i2b2.vm.network "forwarded_port", guest: 80, host: 9081, host_ip: "127.0.0.1"
    i2b2.vm.network "forwarded_port", guest: 9090, host: 9091, host_ip: "127.0.0.1"
  end
  config.vm.define "shrine-node1" do |shrine|
    shrine.vm.box = "harvardcatalyst/centos-7-core"
    shrine.vm.box_version = "0.0.4"
    shrine.vm.provision "shell", inline: "yum -y install epel-release && yum -y install ansible"
    shrine.vm.provision "ansible_local" do |ansible|
      ansible.inventory_path = "hosts"
      ansible.limit = "shrine-node1"
      ansible.playbook = "shrine.yml"
      ansible.become = true
      ansible.extra_vars = "extra_vars.yml"
      ansible.verbose = "v"
    end
    shrine.vm.network "private_network", ip: "172.28.128.6"
    shrine.vm.network "forwarded_port", guest: 6060, host: 6061, host_ip: "127.0.0.1"
    shrine.vm.network "forwarded_port", guest: 6443, host: 6444, host_ip: "127.0.0.1"
  end

  config.vm.provider 'virtualbox' do |vb|
      vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000 ]
      vb.customize [ "setextradata", :id, "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled", "0"]
  end
end
