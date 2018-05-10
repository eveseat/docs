# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "docs"
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.network "private_network", ip: "192.168.33.101"

  config.vm.provider "virtualbox" do |v|
    v.name = "mkdocs"
    v.memory = 4096
    v.cpus = 2
  end

  #config.vm.provision :shell, path: "provisions/bootstrap.sh"
  config.vm.provision :docker

end

#docker build -t eveseat/docs .
# in project root `docker run -d --rm -p 8000:8000 --name docs -v ${PWD}:/docs eveseat/docs`
