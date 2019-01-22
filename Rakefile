require 'dotfiles_bootstrap'

DotfilesBootstrap.configure do |c|
  c.name = 'dotfiles-personal'
end

desc 'Runs all dotfiles configurations'
task :default => %w(
  dotfiles_bootstrap:default
  utils:ctags
  vundle:install
)

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
  desc 'Installs vim bundles'
  task :install => :prepare do
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
end

