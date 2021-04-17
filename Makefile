ifeq ($(OS), Windows_NT)
  detected_OS := Windows
else
  detected_OS := $(shell sh -c 'uname 2>/dev/null || echo Unknown')
endif

# MacOS X
QUOTE := -i
ifeq ($(detected_OS), Darwin)
	QUOTE := -i ''
endif

destroy:
	@vagrant destroy -f
	@rm -rf .ssh .vagrant *.log
	@make unset_config
	@make clean_known_hosts_file
	# @vagrant global-status --prune
	@echo "uninstalled vagrant machine"

setup: gen_ssh_key vagrant_up set_config remove_old_private_key
	@echo ""
	@vagrant ssh-config
	@echo "Installed vagrant machine :)"
	@echo ""
	@echo "visit for more docs: https://www.vagrantup.com/docs/cli"
	@echo ""
	@echo "login via 'vagrant ssh <USERNAME>'"
	@echo "start machine via 'vagrant up'"
	@echo "stop machine via 'vagrant halt'"
	@echo "use 'make destroy' instead of 'vagrant destroy -f'"

gen_ssh_key:
	@mkdir -p "${PWD}/.ssh"
	@ssh-keygen -t rsa -b 4096 -C "" -f "${PWD}/.ssh/id_rsa" -q -P "" <<<y 2>&1 >/dev/null
	@echo "ssh keys are generated"

vagrant_up:
	@vagrant up --provision
	@echo "virtual machine is ready"

unset_config:
	@sed $(QUOTE) 's/conf\.ssh\.username/#conf\.ssh\.username/g' Vagrantfile
	@sed $(QUOTE) 's/conf\.ssh\.private_key_path/#conf\.ssh\.private_key_path/' Vagrantfile
	@echo "configuration has unset"

set_config:
	@sed $(QUOTE) "s/#conf\.ssh/conf\.ssh/g" Vagrantfile
	@echo "configuration has updated"

remove_old_private_key:
	@rm -rf "${PWD}/.vagrant/machines/*/virtualbox/private_key"
	@echo "removed unused data"

clean_known_hosts_file:
	@sed $(QUOTE) "/^192\.168\.*\.*/d" ~/.ssh/known_hosts
	@echo "clean known_hosts file"
