require 'pp'

Vagrant.configure('2') do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  # This in array of all the machines that gets created.
  vms = [
    {
      :name => 'client-int',
      :box => 'bstoots/xubuntu-16.04-desktop-amd64',
      :private_ip => '192.168.50.2',
      :private_net_name => 'client-int',
      :memory => 1024,
      :gui => true,
    },
    {
      :name => 'client-ext',
      :box => 'bstoots/xubuntu-16.04-desktop-amd64',
      :private_ip => '192.168.50.3',
      :private_net_name => 'client-ext',
      :memory => 1024,
      :gui => true,
    },
    {
      :name => 'server-web',
      :box => 'debian/stretch64',
      :private_ip => '192.168.50.3',
      :private_net_name => 'server-web',
      :memory => 512,
    },
    {
      :name => 'router-fw',
      :box => 'juniper/ffp-12.1X47-D15.4-packetmode',
      :private_ip => '192.168.50.3',
      :private_net_name => 'router-fw',
    }
  ]

  # Create each machine.
  vms.each do |machine_def|
    config.vm.define machine_def[:name] do |machine|
      machine.vm.box = machine_def[:box]
      machine.vm.hostname = machine_def[:name]
      machine.vm.network 'private_network',
                          ip: machine_def[:private_ip],
                          virtualbox__intnet: machine_def[:private_net_name]
      
      pp "VM: #{machine_def[:name]}\n #{machine_def}"

      # Only do provider settings if there are any in the definition.
      config.vm.provider "virtualbox" do |vb|
        if machine_def.key?(:memory)
          puts "#{machine_def[:name]} memory: #{machine_def[:memory]}"          
          vb.memory = machine_def[:memory]
        end
        if machine_def.key?(:gui)
          puts "#{machine_def[:name]} GUI: #{machine_def[:gui]}"          
          vb.gui = machine_def[:gui]
        end
      end
    end
  end
end