# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/trusty64'
  # config.vm.box      = 'ubuntu/trusty32'
  # config.vm.box      = 'path/to/the/box'
  config.vm.hostname = 'php-box'

  config.vm.network :forwarded_port, guest: 80, host: 80
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 3306, host: 3306
  config.vm.network :forwarded_port, guest: 10000, host: 10000

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true

  # config.vm.synced_folder "/path/to/folder/projects", "/var/www"

  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"

  # config.vm.provider "virtualbox" do |vb|
  #   vb.gui = true
  #   vb.memory = "1024"
  # end
end
