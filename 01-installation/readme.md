# About

To begin working with Ruby, first install Vagrant, which is a virtual machine framework to level the development world in regards to operating system variance. Once Vagrant is installed, install VirtualBox, which we'll use to run Vagrant.

- Virtual Box: https://www.virtualbox.org/wiki/Downloads
- Vagrant: https://www.vagrantup.com/downloads.html

## How to Setup Vagrant box after downloading and installing the above tools

Navigate to a place you'd like to keep your vagrant box files.

`mkdir {{vagrant_dir}}`

`cd {{vagrant_dir}}`

`vagrant init` = init a vagrant virtual machine

`vagrant box list` = list any vagrant boxes

Install ubuntu:
`vagrant box add ubuntu/trusty64`

Type `ls` to see the `vagrantfile` - open this via:

`sudo vim vagrantfile`

Modify the file to reflect the following:

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
end
```
Now we can start our vagrant box:

`vagrant up`

And then we can connect via SSH directly:

`vagrant ssh`

*Note: any files inside of `/{{vagrant_dir}}` folder will be synched to root of your ssh connection.*

**Please see `/readme_install_part2.md` for the final steps of setup**

### Reasons for using Vagrant

The reasons for using vagrant and a virtual machine are so that we can standardize the development and production environment when working with RoR. Because Windows/Mac/Linux systems are configured slightly differently with RoR, creating a vagrant virtual machine makes things easier for co-editing and deployment.

### You can also still install Locally

You can also still install RoR locally to your machine, but beware, any local development you do, if not housed within a Virtual Machine configuration, may cause troubles when sharing with others/deploying. (Will update this as I learn more)