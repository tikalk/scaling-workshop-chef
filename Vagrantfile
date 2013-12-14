# -*- mode: ruby -*-
# vi: set ft=ruby :
require "etc"

#
# Install Vagrant with the installer from http://vagrantup.com
#
Vagrant.configure("2") do |config|
  config.vm.box = ENV.fetch("VAGRANT_BOX", "precise")
  config.vm.box_url = ENV.fetch("VAGRANT_BOX_URL", "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box")
  config.vm.network "forwarded_port", guest: 9000, host: 6379

  config.vm.define :basebox do |v|
    v.vm.hostname = "basebox-#{Etc.getlogin}.tikal.vagrant"
    v.vm.network :private_network, ip: "192.168.99.50"
    v.vm.provision :shell, inline: "curl -s -L https://www.opscode.com/chef/install.sh | bash >& /dev/null"
  end

  config.vm.provider :virtualbox do |vbox|
    vbox.name = "tikal-vbox"
    vbox.customize ["modifyvm", :id, "--memory", 4096]
    vbox.customize ["modifyvm", :id, "--cpus", 2]
    vbox.customize ["modifyvm", :id, "--cpuhotplug", "on"]
    vbox.customize ["modifyvm", :id, "--cpuexecutioncap", 75]
    vbox.customize ["modifyvm", :id, "--pae", "on"]
    vbox.customize ["modifyvm", :id, "--ioapic", "on"]
    vbox.customize ["modifyvm", :id, "--acpi", "off"]
    vbox.customize ["modifyvm", :id, "--hwvirtex", "on"]
    vbox.customize ["modifyvm", :id, "--vrde", "off"]
    vbox.customize ["setextradata", :id, "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled", "1"] # don't mess with guest clock!
  end
end

