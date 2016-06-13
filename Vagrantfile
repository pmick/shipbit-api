# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.provision :shell, :path => "vagrant_provision.sh"
  config.vm.network "forwarded_port", guest: 4001, host: 4001
end
