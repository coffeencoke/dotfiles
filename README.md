# Matt's dotfiles

These files keep Matt's development environment humming.

# Get Started

To install:

```
bundle install
bundle exec rake
```

Run with dryrun:

```
bundle exec rake dryrun default
```

Other options, which can be chained:

```
bundle exec rake dryrun force debug default
```

# Manual Setup

The following is a list of things I have yet to automate and should be installed
manually for now.

- Install [powerfonts](https://github.com/powerline/fonts) for them to work with
some Oh My ZSH themes.

## Ubuntu Only

The following is already automated for Mac, but needs to be manually installed for Ubuntu:

- [thefuck](https://github.com/nvbn/thefuck)*
  - Uses pip3 to install
- [fzf](https://github.com/junegunn/fzf)*

# Contribute

View the [CONTRIBUTING.md](./CONTRIBUTING.md) file to contribute to this
project.

# Included

* Installs Homebrew, oh-my-zsh, VIM plugins, Ctags
* Installs brew packages, zsh scripts, and common config

# Power Fonts
