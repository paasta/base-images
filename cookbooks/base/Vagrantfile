# -*- mode: ruby -*-
# vi: set ft=ruby :
# needs: `vagrant plugin install vagrant-berkshelf`

Vagrant.configure("2") do |config|
  config.berkshelf.enabled = true

  config.vm.box = "ec2-precise64"
  config.vm.box_url =
    "https://s3.amazonaws.com/mediacore-public/boxes/ec2-precise64.box"
  config.vm.hostname = "base"

  config.vm.provision :shell,
    path: File.expand_path('../script/vagrant-bootstrap', __FILE__)

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "base"
    chef.json = {
      base: {
        hostname: "base",
        login: {
          user: "login"
        },
        loghost: "@1.2.3.4:512",
      }
    }
  end
end
