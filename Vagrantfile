Vagrant.configure("2") do |config|
    config.vm.define "debian" do |v|
        v.vm.box = "debian/bullseye64"
        v.vm.hostname = "vm"
        v.vm.box_version = "11.20220328.1"
        v.vm.provision "shell", :inline => <<-SHELL
        apt-get update
        apt-get install -y puppet
        puppet module install puppetlabs/postgresql 
    SHELL
        v.vm.provision "puppet" do |puppet|
            puppet.manifest_file = "app.pp" 
        end       

        v.vm.provider :virtualbox do |vm|
            vm.name = "debian"
            vm.memory = 1024
            vm.cpus = 2

        end
    end
end