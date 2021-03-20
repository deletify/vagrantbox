# vagrantbox

We must be protected our data while using 3rd party vagrant boxes, ISOs, VDIs.

- [Linux Cheatsheets](https://deletify.app/cheatsheets/linux/)
- [Vagrant Cheatsheets](https://deletify.app/cheatsheets/vagrant/)

## Install
_Virtualbox or any relavent tool is required to run Vagrant._

**Linux (Debian, Ubuntu, Mint)**
```bash
$ apt-get install virtualbox vagrant
```

**MacOSx** _(don't forget to install [Homebrew](https://brew.sh/) if you don't have one)_
```bash
$ brew cask install virtualbox vagrant
```

**Windows** _(Download from the following links)_
- [VirtualBox](https://download.virtualbox.org/virtualbox/6.1.18/VirtualBox-6.1.18-142142-Win.exe)
- [Vagrant 64-bit](https://releases.hashicorp.com/vagrant/2.2.14/vagrant_2.2.14_x86_64.msi) OR
- [Vagrant 32-bit](https://releases.hashicorp.com/vagrant/2.2.14/vagrant_2.2.14_i686.msi)

## Prerequisites
1. Create directory `mkdir my-vagrant` and go into `cd my-vagrant`
1. Download/clone current repository
1. Install required plugins
```sh
$ vagrant plugin install vagrant-disksize vagrant-vbguest
```

## Setting Up a Virtual Machine
- first/one time installation `make setup`
- use `make destroy` instead of `vagrant destroy -f`
- if you are in `my-vagrant` directory
  * login via ssh `vagrant ssh <USERNAME>`
  * stop machine `vagrant halt <USERNAME>`
  * start machine `vagrant up <USERNAME>`
* if you are outside the `my-vagrant` directory then run `vagrant global-status` and get the `ID`
  * login `vagrant ssh <ID>`
  * start machine `vagrant up <ID>`
  * stop machine `vagrant halt <ID>`
