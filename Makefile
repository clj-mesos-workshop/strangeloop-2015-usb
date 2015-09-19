# GNU make includes CURDIR as a built-in variable
VAGRANT_HOME=$(CURDIR)/vagrant
VAGRANT_VERSION=1.7.4
.PHONY: help ?

all:

update:


vagrant-clean:
	rm -r $(VAGRANT_HOME)/setup_version
	rm -r $(VAGRANT_HOME)/data
	rm -r $(VAGRANT_HOME)/gems
	rm -r $(VAGRANT_HOME)/insecure_private_key
	rm -r $(VAGRANT_HOME)/rgloader
	rm -r $(VAGRANT_HOME)/tmp

vagrant-up:
# Set the Env Variable here itself
	VAGRANT_CWD=$(CURDIR)/test VAGRANT_HOME=$(VAGRANT_HOME) vagrant up

hello-mesos-up:
	VAGRANT_CWD=$(CURDIR)/code/hello-mesos VAGRANT_HOME=$(VAGRANT_HOME) \
		vagrant up


hello-mesos-destroy:
	VAGRANT_CWD=$(CURDIR)/code/hello-mesos VAGRANT_HOME=$(VAGRANT_HOME) \
		vagrant destroy

help: ?

?:
	@echo
	@echo ""
