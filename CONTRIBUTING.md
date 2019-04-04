Add files with the followingn extensions to update the dotfiles:

* `*.brew`: line separated list of brew packages to install
* `*.zsh`: ZSH script to symlink into the oh-my-zsh custom folder
* `*.symlink`: Symlinks the file into `~` without the `.symlink` part.
* `*.bin`: Symlinks the file into `~/bin/`.

# Mosh

Mosh is still under construction.

## Installing Mosh on AL2012

> [Mosh](https://mosh.org/) (mobile shell): Remote terminal application that allows roaming, supports intermittent connectivity, and provides intelligent local echo and line editing of user keystrokes.

To install [Mosh](https://mosh.org/#getting) on AL2012, run the following:

```
$ yum install -y protobuf-devel ncurses-devel zlib-devel openssl-devel

$ wget http://www.cpan.org/src/5.0/perl-5.26.1.tar.gz
$ tar -xzvf perl-5.26.1.tar.gz && cd perl*
$ sudo ls && ./Configure -d && make && sudo make install

$ wget https://mosh.org/mosh-1.3.2.tar.gz
$ tar -xzvf mosh-1.3.2.tar.gz && cd mosh-1.3.2
$ ./configure && make && sudo make install
```


