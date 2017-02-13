# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "minimal/jessie64"

  config.vm.provider "virtualbox"

  config.vm.provision "docker"

  # Install gitlab-ci-multi-runner
  config.vm.provision "shell", inline: <<-SHELL
    curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | sudo bash
    sudo apt-get update
    sudo apt-get install gitlab-ci-multi-runner
  SHELL

end
