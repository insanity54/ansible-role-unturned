VAGRANTFILE_API_VERSION = "2"
MACHINE_HOSTNAME = "ansible"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.network :private_network, ip: "192.168.2.2"

  config.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--name", MACHINE_HOSTNAME]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", 2]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "./temp_playbook.yml"
    ansible.sudo = true
    ansible.extra_vars = { ansible_ssh_user: 'vagrant' }
  end

  config.vm.define MACHINE_HOSTNAME do |machine|
      machine.vm.hostname = MACHINE_HOSTNAME
  end

end
