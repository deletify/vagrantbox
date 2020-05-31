# Vagrant Secure Machine

We must be protected our data while using 3rd party vagrant boxes, ISOs, VDIs.

**Install**

```
# install apps
brew cask install vagrant virtualbox

# install vagrant plugins
vagrant plugin install vagrant-disksize vagrant-vbguest

# install vagrant secure machine
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/salmanwaheed/vagrant-secure-machine/master/install.sh)"
```

## TODO

* [ ] random username
* [ ] random ssh port
* [ ] random forwarded port
* [ ] random machine names
* [x] random ssh key every installations
* [x] remove all other users except random generated
* [x] user must set the password during installtions
