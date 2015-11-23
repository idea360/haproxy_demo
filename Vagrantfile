# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Let Berkshelf manage deps for Chef.
  config.berkshelf.enabled = true

  config.vm.define "haproxy" do |haproxy|
    haproxy.vm.box = "ubuntu/trusty64"
    haproxy.vm.hostname = "haproxy"
    haproxy.vm.network "private_network", ip: "192.168.1.2"
    
    # Run an apt-get to make sure our packages in the image are up to date!
    #haproxy.vm.provision "shell", inline: "sudo apt-get update"

    haproxy.vm.provision :chef_solo do |chef|
      chef.run_list = [
        'recipe[haproxy_demo::haproxy]'
       ]
    end
  end

  # First webserver 
  config.vm.define "webserver01" do |webserver|
    webserver.vm.box = "ubuntu/trusty64"
    webserver.vm.hostname = "webserver01"
    webserver.vm.network "private_network", ip: "192.168.1.3"

    # Run an apt-get to make sure our packages in the image are up to date!
    #haproxy.vm.provision "shell", inline: "sudo apt-get update"

    webserver.vm.provision :chef_solo do |chef|
      chef.run_list = [
        'recipe[haproxy_demo::webserver]'
      ]
    end 
  end

  # Second webserver 
  config.vm.define "webserver02" do |webserver|
    webserver.vm.box = "ubuntu/trusty64"
    webserver.vm.hostname = "webserver02"
    webserver.vm.network "private_network", ip: "192.168.1.4"

    # Run an apt-get to make sure our packages in the image are up to date!
    #haproxy.vm.provision "shell", inline: "sudo apt-get update"

    webserver.vm.provision :chef_solo do |chef|
      chef.run_list = [
        'recipe[haproxy_demo::webserver]'
      ]
    end 
  end
  # ...more webservers if needed, just change IP and hostname!
  # Add additional hosts into hash format in attributes file.
end
