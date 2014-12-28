Vagrant.configure(2) do |config|
  config.vm.box = "raring"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network :forwarded_port, host: 8000, guest: 8000
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = 'vvv'
    ansible.playbook = 'playbook.yml'
  end
end
