# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # create master
  config.vm.define :mfsmaster do |mfsmaster_config|
      mfsmaster_config.vm.box = "ubuntu/trusty64"
      mfsmaster_config.vm.hostname = "mfsmaster"
      mfsmaster_config.vm.network :private_network, ip: "10.0.15.10"
      mfsmaster_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
      mfsmaster_config.vm.provision :shell, path: "bootstrap-mfsmaster.sh"
  end

  # create some chunk servers, each with two additional disks
   (1..2).each do |i|
    config.vm.define "chunk#{i}" do |node|
        node.vm.box = "ubuntu/trusty64"
        node.vm.hostname = "chunk#{i}"
        node.vm.network :private_network, ip: "10.0.15.2#{i}"
 #       node.vm.network "forwarded_port", guest: 80, host: "808#{i}"
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "256"
          (0..1).each do |d|
            vb.customize ['createhd',
                          '--filename', "disk-#{i}-#{d}",
                          '--size', '11000']
            # Controller names are dependent on the VM being built.
            # It is set when the base box is made in our case ubuntu/trusty64.
            # Be careful while changing the box.
            vb.customize ['storageattach', :id,
                          '--storagectl', 'SATAController',
                          '--port', 3 + d,
                          '--device', 0,
                          '--type', 'hdd',
                          '--medium', "disk-#{i}-#{d}.vdi"]
          end
          
        end
    end
  end

  # create shadow master
  config.vm.define :shadow do |shadow_config|
      shadow_config.vm.box = "ubuntu/trusty64"
      shadow_config.vm.hostname = "shadow"
      shadow_config.vm.network :private_network, ip: "10.0.15.11"
#      shadow_config.vm.network "forwarded_port", guest: 80, host: 8080
      shadow_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
  end

  # create metalogger
  config.vm.define :meta do |meta_config|
    meta_config.vm.box = "ubuntu/trusty64"
    meta_config.vm.hostname = "meta"
    meta_config.vm.network :private_network, ip: "10.0.15.15"
    #      meta_config.vm.network "forwarded_port", guest: 80, host: 8080
    meta_config.vm.provider "virtualbox" do |vb|
      vb.memory = "256"
    end
  end

  # create cgi server
  config.vm.define :cgi do |cgi_config|
    cgi_config.vm.box = "ubuntu/trusty64"
    cgi_config.vm.hostname = "cgi"
    cgi_config.vm.network :private_network, ip: "10.0.15.16"
    #      cgi_config.vm.network "forwarded_port", guest: 80, host: 8080
    cgi_config.vm.provider "virtualbox" do |vb|
      vb.memory = "256"
    end
  end
  
end
