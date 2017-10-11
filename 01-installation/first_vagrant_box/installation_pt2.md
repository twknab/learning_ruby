# Installation II
In the previous tab, we learned how to set up a VM with Vagrant. In this chapter, we are going to learn how to install Ruby and Rails with our VMs, Vagrant style.

## Provisioning
Vagrant has support for automated provisioning. In other words, we can create a configuration file with everything that we need to download. When we run the command vagrant up, Vagrant will look at that file and download everything for us.

`cd first_vagrant_box`
`touch bootstrap.shCopy`
Open bootstrap.sh and copy and paste the following commands:

    `#!/usr/bin/env bash
    # upgrade and update the system
    echo upgrading and updating the system
    sudo apt-get update
    sudo apt-get -y upgrade
    # install node.js for js runtime when using Rails
    echo installing nodejs for ExecJS runtime and git
    sudo apt-get install -y nodejs
    sudo apt-get install -y git
    # install RVM
    echo installing RVM
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    \curl -sSL https://get.rvm.io | bash -s stable
    source /home/vagrant/.rvm/scripts/rvm
    rvm requirements
    # install Ruby and make 2.3.1 the default
    echo installing ruby
    rvm install 2.3.1
    rvm use 2.3.1 --default
    # install Bundler and Rails
    echo installing bundler and rails
    gem install bundler --no-ri --no-rdoc
    gem install rails -v 4.2.7 --no-ri --no-rdoc
    # install postgres and its dependencies
    echo installing psql and its dependencies
    sudo apt-get install -y postgresql postgresql-contrib libpq-devCopy`


## Edit `Vagrantfile`
Now, we must edit our Vagrantfile so that it uses our provision.

    `Vagrant.configure("2") do |config|
      config.vm.box = "ubuntu/trusty64"
      config.vm.provision :shell, path: "bootstrap.sh", privileged: false
    endCopy`

## Port Forwarding
Once we have everything installed, we need to be able to see the changes that we make in our browser. We can tell Vagrant to open traffic in specific ports so that we can access them from our host machine. For example, we can configure our VM to allow traffic on port 3000 for web development purposes.

Update your Vagrantfile to the following:

    `Vagrant.configure("2") do |config|
      config.vm.box = "ubuntu/trusty64"
      config.vm.network "forwarded_port", guest: 3000, host: 3000
      config.vm.provision :shell, path: "bootstrap.sh", privileged: false
    endCopy`

## Customization
Next, we will add a couple of lines in our Vagrant file to customize our machine even further. We are going to let our machine use 2 GBs of memory with 2 cpus.

`Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"
  config.vm.provision :shell, path: "bootstrap.sh", privileged: false
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]  
    vb.customize ["modifyvm", :id, "--cpus", "2"]  
  end
 end`


## Halt and Provision
Since we have made changes in our configuration and added provision, we must halt the machine and run the vagrant up command with a special flag. While you are in the first_vagrant_box directory, run the following in your terminal:

`$ vagrant halt`
>> ==> default: Attempting graceful shutdown of VM...

`$ vagrant up --provision`

Halt will shut down your machine, and the --provision flag will make sure to install everything that we have in the bootstrap.sh file. Once all the installation is done, your machine will be ready to use.

## Done!
Congratulations, we have installed Ruby and Rails in our vagrant VM. To check that everything is installed, vagrant ssh into your machine and run:

`vagrant@vagrant-ubuntu-trusty-64:~$ ruby -v`
>> ruby 2.3.1
`vagrant@vagrant-ubuntu-trusty-64:~$ rails -v`
>> Rails 4.2.7
