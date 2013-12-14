# Matt Simpson's dot files

Herein lies the software to set up a system the way I like it.

This software uses [Chef](http://getchef.com/) for a few reasons:

## Many Flavors

so that I can have specific configuration for different flavors of computers, like so:

* Ubuntu Server 12.04
* Mac OSX Dev computer
	* Laptop - less disk space, smaller screen size
	* iMac - more disk space, larger screen size
* RHEL 5 / 6
* CentOS

I do not yet have it setup for each of the flavors above, but that is the plan. I will be adding to this as the need becomes apparent in my work.

## Secret Stuff

Often there are configuration files for keys, and passwords, and such. I'd rather you not have them, and I also would rather to not have to lose this if my computer dies, or have to manually change passwords on all of my computers.

# Install

**This is not yet done**

## On Same Computer

If you are on the same computer that you would like to converge, you will need to use chef zero.

```
git clone https://github.com/coffeencoke/dotfiles
cd dotfiles
bundle install
knife cookbook upload cookbooks/* -z
knife role from file roles/* -z

# ... bootstrap instructions here
```

## From different computer

I like to have continuous integration setup, so that I don't have to manually converge all of my computers.

Because of this, I setup a lightweight chef server, with jenkins, that will listen for all repositories that my dotfiles wants to have trigger an update, and then automatically converge all servers.

Because of this, I do not use chef-zero, I use an actual open source chef server. And cookbooks, roles, environments, etc, are all uploaded to that server.

## Development

I want to be able to develop, and experiment with my dotfiles, without doing something that cripples my actual computer. Because of this, I use a virtual machine to test all dotfiles development.

Install [Vagrant](http://www.vagrantup.com/) and [Virtual Box](https://www.virtualbox.org/wiki/Downloads).

Install the vagrant-chef-zero, vagrant-omnibus, and vagrant-berkshelf plugins:

```
vagrant plugin install vagrant-chef-zero vagrant-omnibus vagrant-berkshelf
```

Clone the repo and install gems:

```
git clone https://github.com/coffeencoke/dotfiles
cd dotfiles
bundle install
```

Bootup and converge the VM:

```
vagrant up
```

SSH into the server to play around and test your development:

```
vagrant ssh
```

# Thanks

Thanks to the following people, some are inspirations, others are
sources of contribution:

* https://github.com/holman/dotfiles
* https://github.com/sandersch/dotfiles
* https://github.com/ryanb/dotfiles
* https://github.com/r00k/dotfiles
