# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.require_plugin "vagrant-chef-zero"
Vagrant.require_plugin "vagrant-omnibus"
Vagrant.require_plugin "vagrant-berkshelf"

Vagrant.configure("2") do |config|
  config.omnibus.chef_version = '11.8.2'
  config.vm.box = "ubuntu-12.04"
  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box"
  config.vm.network :forwarded_port, host: 4567, guest: 80
  config.vm.hostname = "coffeencoke-dotfiles"
  config.vm.provider "virtualbox" do |v|
    v.name = "coffeencoke-dotfiles"
  end
  config.vm.provision :chef_client do |chef|
    chef.environment = "ubuntu"
    chef.run_list = [
      "role[dev_workstation]"
    ]
  end
  config.chef_zero.chef_repo_path = "."
  config.berkshelf.enabled = true
end
