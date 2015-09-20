# Building your own Mesos Framework using Clojure

This companion USB drive contains the items required for following the
tasks in the workshop.

## Supported Systems

Due to our limited time and experience, these are the base systems
we were able to test on.

- OSX 10.8+
- Linux
  + Ubuntu
  + CentOS

- We haven't ran or tested on Windows, there's no reason it shouldn't
work if you have a working Vagrant environment already.

### System Capabilities

Since you would be using your own machine for following the workshop,
we have some requirements. Vagrant does allow for using a cloud based
provider that you can try at a later time after the workshop. We
recommend the following system requirements.



- CPU: At least dual core, ideally quad-core (We're running 3 VMs)
- Memory: 4GB at least, 8 GB ideally
- Disk: 5 GB free space at least, 8 GB ideally. (There are ways to use
the USB disk space too, let us know if you want to do that)


## Tools

- OSX
  + homebrew (should be optional but we haven't tested without it)

- Editor
  + vim with fireplace
  + emacs with CIDER
  + IntelliJ with Cursive
  + others - Sublime, Eclipse
- Linux - If you are on the latest stable or long term release, most
things sould work

- Vagrant 1.7.4
- Virtualbox 5.0
- Git (1.7+, shouldn't matter a lot)
- Make (we supply a Makefile that could make some tasks easier)



## Getting Setup

### Step 1: Installing Vagrant and Virtualbox

We have included the installers for major platforms in the
corresponding directories. The directory is outlined below.



## Lessons

The lessons are broken out into steps which are in various branches

###


## Directory structure for Vagrant

```
vagrant
├── boxes
│   └── edpaget-VAGRANTSLASH-mesos
│       ├── 0.1.0
│       │   └── virtualbox
│       │       ├── Vagrantfile
│       │       ├── box.ovf
│       │       ├── metadata.json
│       │       └── packer-virtualbox-iso-1440967130-disk1.vmdk
│       └── metadata_url
└── installers
├── 1.7.4_SHA256SUMS
├── linux-centos
│   ├── 32-bit
│   │   └── vagrant_1.7.4_i686.rpm
│   └── 64-bit
│       └── vagrant_1.7.4_x86_64.rpm
├── linux-debian
│   ├── 32-bit
│   │   └── vagrant_1.7.4_i686.deb
│   └── 64-bit
│       └── vagrant_1.7.4_x86_64.deb
├── mac
│   └── vagrant_1.7.4.dmg
└── windows
└── vagrant_1.7.4.msi
```

## Directory structure for Virtualbox

```
virtualbox
├── SHA256SUMS
├── VirtualBox-5.0.4-102546-OSX.dmg
├── VirtualBox-5.0.4-102546-Win.exe
├── linux-all
│   ├── VirtualBox-5.0.4-102546-Linux_amd64.run
│   └── VirtualBox-5.0.4-102546-Linux_x86.run
└── linux-ubuntu
├── virtualbox-5.0_5.0.4-102546~Ubuntu~trusty_amd64.deb
    └── virtualbox-5.0_5.0.4-102546~Ubuntu~trusty_i386.deb
```
