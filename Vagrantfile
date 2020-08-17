# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
#  config.vm.box = "hashicorp/bionic64"



  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.boot_timeout = 600
    master.vm.box = "hashicorp/bionic64"
    master.vm.provision "shell", privileged: false, path: "scripts/install_python.sh"
    master.vm.network :private_network, ip: "192.168.50.120", auto_config: true
    master.vm.network "forwarded_port", guest: 6443, host: 6443, protocol: "tcp" 
    master.vm.network "forwarded_port", guest: 8001, host: 8001, protocol: "tcp" 
    master.vm.network "forwarded_port", guest: 8080, host: 8080, protocol: "tcp"
    master.vm.synced_folder "istio/istio-1.6.0", "/home/vagrant/istio"
    master.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "4096"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end

  
  config.vm.define "node01" do |node01|
    node01.vm.hostname = "node01"
    node01.vm.box = "hashicorp/bionic64"
    node01.vm.boot_timeout = 600
    node01.vm.provision "shell", privileged: false, path: "scripts/install_python.sh"
    node01.vm.network :private_network, ip: "192.168.50.130", auto_config: true
    node01.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      #vb.customize ['createhd', '--filename', './tmp/node001-disk.vdi', '--size', 10 * 1024]
      #vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', './tmp/node001-disk.vdi']
    end
  end
  config.vm.define "node02" do |node02|
    node02.vm.hostname = "node02"
    node02.vm.box = "hashicorp/bionic64"
    node02.vm.boot_timeout = 600
    node02.vm.provision "shell", privileged: false, path: "scripts/install_python.sh"
    node02.vm.network :private_network, ip: "192.168.50.131", auto_config: true
    node02.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      #vb.customize ['createhd', '--filename', './tmp/node002-disk.vdi', '--size', 10 * 1024]
      #vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', './tmp/node002-disk.vdi']
    end
  end

 # config.vm.define "node03" do |node03|
 #   node03.vm.hostname = "node03"
 #   node03.vm.box = "hashicorp/bionic64"
 #   node03.vm.network :private_network, ip: "192.168.50.132", auto_config: true
 #   node03.vm.provider :virtualbox do |vb|
 #     vb.customize ["modifyvm", :id, "--memory", "2048"]
 #     vb.customize ["modifyvm", :id, "--cpus", "2"]
 #     #vb.customize ['createhd', '--filename', './tmp/node003-disk.vdi', '--size', 10 * 1024]
 #     #vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', './tmp/node003-disk.vdi']
 #   end
 # end
  
  config.vm.define "engine" do |engine|
    engine.vm.hostname = "engine"
    engine.vm.box = "hashicorp/bionic64"
    engine.vm.provision "shell", privileged: false, path: "scripts/install_python.sh"
    engine.vm.provision "shell", privileged: false, path: "scripts/install_ansible.sh"
    engine.vm.provision "shell", privileged: false, path: "scripts/install_metrics.sh"
    engine.vm.network :private_network, ip: "192.168.50.110", auto_config: true
    engine.vm.synced_folder "ansible/", "/home/vagrant/ansible"
    engine.vm.synced_folder "istio/istio-1.6.0", "/home/vagrant/istio"
  end

  

end
