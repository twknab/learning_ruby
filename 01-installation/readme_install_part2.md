# Provisioning and Connecting to Vagrand Box

We are going to create a shell file/bash file so that when we start our vagrant box, everything we need to run RoR is downloaded and installed and ready to go for us.

The first thing we want to do, is, within our `/{{vagrant_dir}}` create a new file:

`touch bootstrap.sh`

Open this file and paste the following:

`sudo vim bootstrap.sh`

```ruby
#!/usr/bin/env bash
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
sudo apt-get install -y postgresql postgresql-contrib libpq-dev
```

Now let's open back up our `vagrantfile` and add our provisioning script to our vagrant box on startup:


```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, path: "bootstrap.sh", privileged: false
end
```

## Port Forwarding

We can also add Port Forwarding to our vagrant box by adding:

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.provision :shell, path: "bootstrap.sh", privileged: false
end
```

Our development server will now run on port 3000.

We'll also go ahead and customize our virutal machine to run with 2GB of memory:

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"
  config.vm.provision :shell, path: "bootstrap.sh", privileged: false
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]  
    vb.customize ["modifyvm", :id, "--cpus", "2"]  
  end
end
```

Now we must halt the machine, and re-start it, this time using our provisioning:

`vagrant halt`

`vagrant up --provision`

Now if we connect via ssh again, we can see that Ruby and Rails are both installed!

`vagrant ssh`

`ruby -v`

`rails -v`