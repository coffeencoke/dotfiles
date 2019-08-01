# Matt's dotfiles

These files keep Matt's development environment humming.

# What's Included?

Installs...

- Homebrew (+brew packages)
- Shell (oh-my-zsh, custom scripts, plugins, config)
- VIM (custom config, plugins)
- Ctags, AutoCompletion, FZF, TheFuck

# Get Started

To install:

```
bundle install
bundle exec rake
```

Other tasks:

```
bundle exec rake -T

# Run with dryrun:
bundle exec rake dryrun default

# Dryrun, force, debug
bundle exec rake dryrun force debug default
```

# Manual Setup

The following is a list of things I have yet to automate and should be installed
manually for now.

- Install [powerfonts](https://github.com/powerline/fonts) for them to work with
some Oh My ZSH themes.
- Python3 and pip3
- For Mac: https://github.com/sindresorhus/quick-look-plugins

## Ubuntu Only

The following is already automated for Mac, but needs to be manually installed for Ubuntu:

- [thefuck](https://github.com/nvbn/thefuck)*
  - Uses pip3 to install

# Contribute

View the [CONTRIBUTING.md](./CONTRIBUTING.md) file to contribute to this
project.
