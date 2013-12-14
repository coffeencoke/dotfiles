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

## Pro

*if you already have the chef elements uploaded to a server*

```
knife 
```

## Advanced

This currently uses Chef-Zero to contain the cookbooks for converging the servers.

To upload stuff to the cookbooks, like a role and a cookbook for instance, you simply have to set the `-z` option:

```
knife role from file roles/dev_workstation.rb -z
knife cookbook upload bash_alias -z
```

And then you can check to see if the role and cookbook was added:

```
matt@stella ~/Projects/cookbooks
$ knife cookbook list -z
bash_alias   0.1.0

matt@stella ~/Projects/cookbooks
$ knife role list -z
```

## Development

Install [Vagrant](http://www.vagrantup.com/) and [Virtual Box](https://www.virtualbox.org/wiki/Downloads).

Install the vagrant-chef-zero plugin:

```
vagrant plugin install vagrant-chef-zero
```

Clone the repo and install gems:

```
git clone https://github.com/coffeencoke/dotfiles
cd dotfiles
bundle install
vagrant up
```



# Thanks

Thanks to the following people, some are inspirations, others are
sources of contribution:

* https://github.com/holman/dotfiles
* https://github.com/sandersch/dotfiles
* https://github.com/ryanb/dotfiles
* https://github.com/r00k/dotfiles
