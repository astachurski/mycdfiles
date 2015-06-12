# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = [
  { :hostname => 'go-cd-server', :ip => '192.168.33.10', :ram => '2048' },
  { :hostname => 'go-cd-agent-build',  :ip => '192.168.33.20', :ram => '2048' },
  { :hostname => 'go-cd-agent-functesting',  :ip => '192.168.33.21', :ram => '2048' }
]


Vagrant.configure(2) do |config|

  nodes.each do | node |
    
    config.vm.define node[:hostname] do | node_config |

      node_config.vm.box = "hashicorp/precise32"
      node_config.vm.network :private_network, ip: node[:ip]
      node_config.vm.hostname = node[:hostname]
    
      node_config.vm.provision :shell do | shell |
        #call common provisioning script. Pass params if needed.
        shell.path = 'shells/deploy.sh'
        # shell.path = 'shells/deploy-otp.sh'
        # shell.path = 'shells/go-cd-agent-build-deploy.sh'
      end
    end
  end
end
