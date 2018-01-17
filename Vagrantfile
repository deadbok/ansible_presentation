Vagrant.configure('2') do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = false
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  # This is in array of all the machines that gets created.
  vms = [
    {
      :name => 'client-int',
      :box => 'remram/debian-8-amd64-xfce',
      :private_ip => '192.168.50.4',
      :private_net_name => 'int-net',
      :memory => 1024,
      :cpus => 1,
      :gui => true,
    },
    {
      :name => 'client-ext',
      :box => 'remram/debian-8-amd64-xfce',
      :private_ip => '192.168.60.3',
      :private_net_name => 'ext-net',
      :memory => 1024,
      :cpus => 1,
      :gui => true,
    },
    {
      :name => 'server-web',
      :box => 'debian/stretch64',
      :private_ip => '192.168.50.3',
      :private_net_name => 'int-net',
      :memory => 512,
      :cpus => 1,
      :gui => false,
    }
  ]

  # Create each machine.
  vms.each do |machine_def|
    config.vm.define machine_def[:name] do |machine|
      machine.vm.box = machine_def[:box]
      machine.vm.hostname = machine_def[:name]
      if machine_def.key?(:private_ip)
        machine.vm.network 'private_network',
                            ip: machine_def[:private_ip],
                            virtualbox__intnet: machine_def[:private_net_name]
      end
      if machine_def.key?(:public_ip)
        machine.vm.network 'public_network',
                            ip: machine_def[:private_ip]
      end

      # Only do provider settings if there are any in the definition.
      config.vm.provider "virtualbox" do |vb|
        if machine_def.key?(:memory)
          vb.memory = machine_def[:memory]
        end
        if machine_def.key?(:cpus)
          vb.cpus = machine_def[:cpus]
        end
        if machine_def.key?(:gui)
          vb.gui = machine_def[:gui]
        end
      end
    end
  end
  config.vm.define "router-fw" do |machine|
    machine.vm.box = 'juniper/ffp-12.1X47-D15.4-packetmode'
    machine.vm.hostname = 'router-fw'
    machine.vm.network 'private_network',
                        ip: "192.168.50.2",
                        virtualbox__intnet: "int-net"
    machine.vm.network 'private_network',
                        ip: "192.168.60.2",
                        virtualbox__intnet: "ext-net"
  end
end
