# -*- mode: ruby -*-
# vi: set ft=ruby :

# Stripped-down Vagrantfile for development



# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provider :virtualbox do |vbox, override|
    vbox.memory = 1024
    vbox.cpus = 2
  end

  config.ssh.forward_agent = true

  config.vm.network "private_network", ip: "192.168.10.200"
  config.vm.provision :shell, path: "setup.sh"

  # mongodb
  config.vm.network "forwarded_port", guest: 27017, host: 27017, host_ip: "127.0.0.1"
  # share folder
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
end