# GNU make includes CURDIR as a built-in variable
VAGRANT_HOME=$(CURDIR)/vagrant
VAGRANT_VERSION=1.7.4
SHASUM_EXEC=shasum
SHASUM_ARGS=-a 256
LEIN_HOME=$(CURDIR)/tmp/lein-home
LEIN_EXEC=$(CURDIR)/bin/lein
.PHONY: help ?

all:

validate-installers:

update: vagrant-full-update hello-mesos-git-pull lein-install hello-mesos-lein-deps

vagrant-full-update: download-vagrant sync-vagrant-box

lein-install: $(CURDIR)/bin/lein $(CURDIR)/tmp/lein-home

# Installers
vagrant-dirs:
	mkdir -p $(CURDIR)/vagrant/installers
	mkdir -p $(CURDIR)/vagrant/installers/linux-{centos,debian}/{32,64}-bit
	mkdir -p $(CURDIR)/vagrant/installers/mac
	mkdir -p $(CURDIR)/vagrant/installers/windows
	mkdir -p $(CURDIR)/vagrant/boxes


vagrant/installers/1.7.4_SHA256SUMS: | vagrant-dirs
	wget https://dl.bintray.com/mitchellh/vagrant/1.7.4_SHA256SUMS?direct -O $@

vagrant/installers/mac/vagrant_1.7.4.dmg: | vagrant-dirs
	wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4.dmg -O $@

vagrant/installers/windows/vagrant_1.7.4.msi: | vagrant-dirs
	wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4.msi -O $@

vagrant/installers/linux-centos/32-bit/vagrant_1.7.4_i686.rpm: | vagrant-dirs
	wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4_i686.rpm -O $@

vagrant/installers/linux-centos/64-bit/vagrant_1.7.4_x86_64.rpm: | vagrant-dirs
	wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4_x86_64.rpm -O $@

vagrant/installers/linux-debian/32-bit/vagrant_1.7.4_i686.deb: | vagrant-dirs
	wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4_i686.deb -O $@

vagrant/installers/linux-debian/64-bit/vagrant_1.7.4_x86_64.deb: | vagrant-dirs
	wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4_x86_64.deb -O $@

download-vagrant: vagrant-dirs vagrant/installers/mac/vagrant_1.7.4.dmg \
		vagrant/installers/windows/vagrant_1.7.4.msi \
		vagrant/installers/linux-centos/32-bit/vagrant_1.7.4_i686.rpm \
		vagrant/installers/linux-centos/64-bit/vagrant_1.7.4_x86_64.rpm \
		vagrant/installers/linux-debian/32-bit/vagrant_1.7.4_i686.deb \
		vagrant/installers/linux-debian/64-bit/vagrant_1.7.4_x86_64.deb \
		vagrant/installers/1.7.4_SHA256SUMS


sync-vagrant-box: vagrant/boxes/edpaget-VAGRANTSLASH-mesos

vagrant/boxes/edpaget-VAGRANTSLASH-mesos:
	cp -r ${HOME}/.vagrant.d/boxes/edpaget-VAGRANTSLASH-mesos vagrant/boxes


vagrant-clean:
	rm -r $(VAGRANT_HOME)/setup_version || true
	rm -r $(VAGRANT_HOME)/data || true
	rm -r $(VAGRANT_HOME)/gems || true
	rm -r $(VAGRANT_HOME)/insecure_private_key || true
	rm -r $(VAGRANT_HOME)/rgloader || true
	rm -r $(VAGRANT_HOME)/tmp || true

$(CURDIR)/tmp/lein-home:
	mkdir -p $@

$(CURDIR)/bin/lein:
	wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
	 -O $@
	chmod +x $@

hello-mesos-git-pull:
	cd $(CURDIR)/code/hello-mesos && git pull origin master

hello-mesos-lein-deps: | $(CURDIR)/bin/lein
	cd $(CURDIR)/code/hello-mesos && LEIN_HOME=$(LEIN_HOME) $(LEIN_EXEC) deps

hello-mesos-up:
	VAGRANT_CWD=$(CURDIR)/code/hello-mesos VAGRANT_HOME=$(VAGRANT_HOME) \
		vagrant up

hello-mesos-stop:
	VAGRANT_CWD=$(CURDIR)/code/hello-mesos VAGRANT_HOME=$(VAGRANT_HOME) \
		vagrant halt

hello-mesos-destroy:
	VAGRANT_CWD=$(CURDIR)/code/hello-mesos VAGRANT_HOME=$(VAGRANT_HOME) \
		vagrant destroy

help: ?

?:
	@echo
	@echo ""
