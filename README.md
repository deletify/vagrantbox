# Vagrant Machine

We must be protected our data while using 3rd party vagrant boxes, ISOs, VDIs.

**Install**

* [vagrant](https://www.vagrantup.com/downloads.html) and [virtualbox](https://www.virtualbox.org/wiki/Downloads) are prerequisites
* download repo `git clone https://github.com/salmanwaheed/vagrant-machine.git`
* goto `cd vagrant-machine`
* fresh setup `make setup`
* remove the machine `make destroy`
* login via ssh `vagrant ssh`

## Tips to learn advance
* run any command without going inside the machine via `ssh -p <PORT> -i <ID_RSA_PATH> <USER@DOMAIN> 'ANY-LINUX-COMMAND'`
* transfer any data without going inside the machine via `sudo scp -P <PORT> -i <ID_RSA_PATH> </local/path> <USER@DOMAIN>:/remote/path`
* generate ssh key via `ssh-keygen -t rsa -b 4096 -C "your@email.com" -f /path/to/key`
* create public key from private key via `ssh-keygen -y -f .ssh/id_rsa > .ssh/id_rsa.pub`
