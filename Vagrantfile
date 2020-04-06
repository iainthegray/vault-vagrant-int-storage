# BOX_IMAGE = "vault-consul-ent"
BOX_IMAGE = "bento/ubuntu-18.04"

Vagrant.configure("2") do |config|

  config.vm.define "vault-server-1" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "vault-1"
    subconfig.vm.network "private_network", ip: "10.0.1.10"
    subconfig.vm.network "forwarded_port", guest: 8200, host: 8200
    subconfig.vm.provision "shell" do |s|
      s.path =  "install-vault.sh"
      s.args = ['vault-1', '10.0.1.10']
    end
  end
  config.vm.define "vault-server-2" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "vault-2"
    subconfig.vm.network "private_network", ip: "10.0.1.11"
    subconfig.vm.network "forwarded_port", guest: 8200, host: 8700
    subconfig.vm.provision "shell" do |s|
      s.path =  "install-vault.sh"
      s.args = ['vault-2', '10.0.1.11']
    end
  end
  config.vm.define "vault-server-3" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "vault-3"
    subconfig.vm.network "private_network", ip: "10.0.1.12"
    subconfig.vm.network "forwarded_port", guest: 8200, host: 9200
    subconfig.vm.provision "shell" do |s|
      s.path =  "install-vault.sh"
      s.args = ['vault-3', '10.0.1.12']
    end
  end
end
