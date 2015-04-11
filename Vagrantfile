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
      sudo echo "10.0.0.30 jenkins" >> /etc/hosts
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
      sudo echo "10.0.0.30 jenkins" >> /etc/hosts
      wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
      sudo dpkg -i puppetlabs-release-trusty.deb
      sudo apt-get update
      sudo apt-get install puppet -y
    SHELL
  end

  config.vm.define "jenkins" do |node|
    node.vm.box = "ubuntu/trusty64"

    node.vm.hostname = "jenkins"
    node.vm.network :private_network, ip: "10.0.0.30"

    node.vm.provision "shell", inline: <<-SHELL
      sudo echo "10.0.0.10 puppet" >> /etc/hosts
      sudo echo "10.0.0.10 agent" >> /etc/hosts
      wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
      sudo echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
      sudo apt-get update
      sudo apt-get install jenkins -y
      sudo su - jenkins -c "wget http://updates.jenkins-ci.org/update-center.json -qO- | sed '1d;$d'  > /var/lib/jenkins/updates/default.json"
      sudo service jenkins start
      sleep 20
      sudo wget http://10.0.0.30:8080/jnlpJars/jenkins-cli.jar -O /root/jenkins-cli.jar
      sudo java -jar /root/jenkins-cli.jar -s http://10.0.0.30:8080/ install-plugin http://updates.jenkins-ci.org/latest/git.hpi
      sudo java -jar /root/jenkins-cli.jar -s http://10.0.0.30:8080/ install-plugin https://updates.jenkins-ci.org/latest/build-pipeline-plugin.hpi
      sudo java -jar /root/jenkins-cli.jar -s http://10.0.0.30:8080/ safe-restart
    SHELL
  end
end
