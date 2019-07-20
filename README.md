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

- [fzf](https://github.com/junegunn/fzf)*
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/)
- Install [powerfonts](https://github.com/powerline/fonts) for them to work with
some Oh My ZSH themes.
- YouCompleteMe requires manual setup: https://github.com/ycm-core/YouCompleteMe#macos
  - `cd ~/.vim/bundle/YouCompleteMe`
  - `./install.py --clang-completer --ts-completer`

## Ubuntu Only

The following is already automated for Mac, but needs to be manually installed for Ubuntu:

- [thefuck](https://github.com/nvbn/thefuck)*
  - Uses pip3 to install

# Contribute

View the [CONTRIBUTING.md](./CONTRIBUTING.md) file to contribute to this
project.

# Included

* Installs Homebrew, oh-my-zsh, VIM plugins, Ctags
* Installs brew packages, zsh scripts, and common config

# Power Fonts
