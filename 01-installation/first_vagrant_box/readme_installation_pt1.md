# About

This is our first vagrant virtual machine project.

Vagrant allows us to run another OS essentially in a small box. We then develop our apps to run in this environment. We are able to synch the files in our virtual environment to our local host (ie, our local computer). So we can add files and work locally, and these files will be accessible in our virtual environment.


## What We Do For First Project:

We downloaded a virtual box to use globally:

`vagrant box add ubuntu/trusty64`

We can find this box listed globally via:

`vagrant box list`

Next, we will configure our Vagrantfile to use the box that we just downloaded. Open the Vagrantfile and let's configure our virtual machine to boot up with our ubuntu box.

`Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
end`

## Vagrant Up

So far, we have done a couple things.

Downloaded a ubuntu image.

Initialized a directory with a Vagrantfile that uses that image.
Next, we have to actually spin up that image into a running virtual machine. In your console, run:

`$ vagrant up`

Once the VM is up and running, we can ssh into it.

`$ vagrant ssh`

This command allows you to ssh into your virtual machine and interact with it. Soon, we will install Ruby and Ruby On Rails into our machines!

## Synced Folder

Everything is great so far, but how do we actually develop with our VM. Unless you are an expert in terminal editors such as VIM or Nano, writing code in your VMs does not seem like fun. So, Vagrant comes with a synced folder functionality. While you are ssh'ed into your VM, run:

vagrant@vagrant-ubuntu-trusty-64:~$ cd /vagrant
vagrant@vagrant-ubuntu-trusty-64:~$ ls
Vagrantfile
This /vagrant directory in your VM is automatically synced with the host machine's directory where vagrant init was executed. This means, if we open another terminal window and create a new file in host's first_vagrant_box directory, we will see that file in the VM /vagrant directory

`$ cd first_vagrant_box`
`$ touch is_this_file_synced`

## Moment of truth.

vagrant@vagrant-ubuntu-trusty-64:~$ cd /vagrant
vagrant@vagrant-ubuntu-trusty-64:~$ ls
is_this_file_synced  Vagrantfile


# Useful Vagrant Commands:
- vagrant init: Initializes vagrant with a Vagrantfile
- vagrant up: Starts the vagrant machine
- vagrant up --provision: Starts the machine with the provision
- vagrant ssh: Starts a ssh session
- vagrant halt: Stops the machine
- vagrant destroy: Stops and deletes the machine
- vagrant box add: Adds a vagrant box image on your computer
- vagrant box list: List of all the vagrant boxes on your computer
