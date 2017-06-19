# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagranfile to provide 3 boxes for Openstack deployment (uch, and 2 compute nodes)
# Create 2 host only network, and use IP address from the auto generated subnet to replace 
# the existing one

Vagrant.configure("2") do |config|
  # config.vm.synced_folder ".", "/vagrant"
 
  config.vm.define "uch" do |uch|
    uch.vm.box = "bento/ubuntu-16.04"
    uch.vm.hostname = "uch"
    # uch.vm.network "private_network", ip: "192.168.3.10"
    # uch.vm.network "private_network", ip: "192.168.80.10"
    uch.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"] = "4096"
      v.vmx["numvcpus"] = "4"
      v.vmx["vhv.enable"] = "TRUE"
    end
    # bootstrap Ubuntu Container Host using shell script
    uch.vm.provision :shell, path: "provision.sh"

    uch.vm.provision :docker do |d|
      d.pull_images "bitnami/apache"
      d.run "apache",
      image: "bitnami/apache",
      args: "-p 8080:80 -p 8443:443"
      # cmd: "nc -p 8080 -l -l -e echo hello world!"
    end
  end
end
