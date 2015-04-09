# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.define "puppet" do |node|
    node.vm.box = "ubuntu/trusty64"

    node.vm.hostname = "puppet"
    node.vm.network :private_network, ip: "10.0.0.10"

    node.vm.synced_folder "./modules", "/etc/puppet/modules"
    node.vm.synced_folder "./manifests", "/etc/puppet/manifests"

    node.vm.provision "shell", inline: <<-SHELL
      sudo echo "10.0.0.10 agent" >> /etc/hosts
      wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
      sudo dpkg -i puppetlabs-release-trusty.deb
      sudo apt-get update
      sudo apt-get install puppetmaster-passenger -y
    SHELL
  end

  config.vm.define "agent" do |node|
    node.vm.box = "ubuntu/trusty64"

    node.vm.hostname = "agent"
    node.vm.network :private_network, ip: "10.0.0.20"

    node.vm.provision "shell", inline: <<-SHELL
      sudo echo "10.0.0.10 puppet" >> /etc/hosts
      wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
      sudo dpkg -i puppetlabs-release-trusty.deb
      sudo apt-get update
      sudo apt-get install puppet -y
    SHELL
  end
end
