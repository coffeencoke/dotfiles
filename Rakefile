require 'dotfiles_bootstrap'

GEMS = %w(
  tmuxinator
).freeze

DotfilesBootstrap.configure do |c|
  c.name = 'dotfiles-personal'
end

default_tasks = %w(
  dotfiles_bootstrap:default
  utils:ctags
  vundle:install
  gem:install_packages
  zsh:install_zsh_autosuggestions
  fzf:install
)
if DotfilesBootstrap.mac?
  default_tasks << 'zsh:install_one_time'
end

desc 'Runs all dotfiles installers and configuration scripts'
task default: default_tasks

namespace :fzf do
  desc 'Installs fzf: '
  task :install do
    DotfilesBootstrap.exec_cmd 'git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf', command_noun: 'fzf git clone'
    DotfilesBootstrap.exec_cmd '~/.fzf/install', command_noun: 'fzf Installer'
  end
end

namespace :zsh do
  desc 'Installs zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md'
  task :install_zsh_autosuggestions do
    DotfilesBootstrap.exec_cmd "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions",
      command_noun: "zsh-autosuggestions"
  end

  desc 'One Time Installers'
  task :install_one_time do
    DotfilesBootstrap.logger.info 'Installing zsh one-time scripts'
    # Set a crazy fast keyboard repeat rate
    DotfilesBootstrap.exec_cmd 'defaults write NSGlobalDomain KeyRepeat -int 1', command_noun: 'KeyRepeat'
    DotfilesBootstrap.exec_cmd 'defaults write NSGlobalDomain InitialKeyRepeat -int 15', command_noun: 'InitialKeyRepeat'
  end
end

namespace :gem do
  desc 'Installs rubygems'
  task :install_packages do
    `gem install #{GEMS.join(" ")}`
  end
end

namespace :utils do
  desc 'Installs ctags 5.8'
  task :ctags do
    DotfilesBootstrap.logger.info 'Installing ctags'
    `which ctags`
    unless $?
      cmd = <<-CMD
  cd /tmp && wget https://downloads.sourceforge.net/project/ctags/ctags/5.8/ctags-5.8.tar.gz &>/dev/null &&
  cd /tmp && tar -xzf ctags-5.8.tar.gz && rm ctags-5.8.tar.gz &>/dev/null &&
  cd /tmp/ctags-5.8 && ./configure &>/dev/null && make &>/dev/null && sudo make install &>/dev/null && cd ../ && rm -Rf ctags-5.8
CMD
      DotfilesBootstrap.exec_cmd cmd, command_noun: 'CTAG installation script'
    end
  end
end

namespace :vundle do
  desc 'Installs vundler, packages, and post-hooks'
  task install: [:prepare, :install_vim_bundles]

  desc 'Installs vim bundles'
  task :install_vim_bundles => :prepare do
    DotfilesBootstrap.logger.info 'Updating vim bundles with vundle. This may take a moment...'
    bundle_file = "vim.symlink/bundles.vim"
    DotfilesBootstrap.exec_cmd "vim -E -u \"#{bundle_file}\" +BundleInstall +qall", command_noun: 'Vundle Executor'
  end

  desc 'Install vundler'
  task :prepare do
    DotfilesBootstrap.logger.info 'Installing vundler'
    DotfilesBootstrap.change_file '~/.vim/bundle/vundle' do |path|
      DotfilesBootstrap.exec_cmd "git clone https://github.com/gmarik/vundle.git #{path}", command_noun: 'Vundle Installer'
    end
  end

  # Currently no in vundle
  # desc 'Install YouCompleteMe'
  # task :install_youcompleteme, :install_vim_bundles do
  #   DotfilesBootstrap.change_file '~/.vim/bundle/YouCompleteMe' do |path|
  #     DotfilesBootstrap.exec_cmd "./install.py --clang-completer --ts-completer", command_noun: "YouCompleteMe"
  #   end
  # end
end
