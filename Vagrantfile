# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|
   config.vm.box = "ubuntu/focal64"
   config.vm.network "private_network", ip: "192.168.33.10"
   config.vm.hostname = "yolovm"
   config.vm.provider "virtualbox" do |virtualbox|
      virtualbox.memory = "2048"
   end
   config.vm.provision "ansible" do |ansible|
     ansible.verbose = "vv"
     ansible.playbook = "playbook.yml"
   end
 end
