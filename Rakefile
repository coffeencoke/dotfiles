require 'rake'

task :default => ['oh_my_zsh:install', :symlinks, :customize_zsh, 'vundle:install', 'brew:install_packages', 'utils:ctags']

namespace :oh_my_zsh do
  desc 'Installs oh my zsh'
  task :install do
    if File.exists?(File.expand_path("~/.oh-my-zsh"))
      STDERR.puts "oh-my-zsh seems to already be installed, overwrite? (Y/n)"
      answer = STDIN.gets.chomp.downcase
      unless ["", "y", "yes", "ya"].include?(answer)
        STDERR.puts "Fine, be that way"
        next
      end
    end

    STDERR.puts "Installing oh-my-zsh"
    `curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh`
    STDERR.puts "zsh installed successfully" if $?
  end
end

def symlink_files(files)
  skip_all = false
  overwrite_all = false
  backup_all = false

  files.each do |file, target|
    overwrite = false
    backup = false

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        STDERR.puts "Target already exists (#{target}), what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all, [q] quit"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        when 'q' then exit(1)
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "#{target}" "#{target}.backup"` if backup || backup_all
    end

    unless skip_all
      `ln -s "#{file}" "#{target}"`
      STDERR.puts "Wrote symlink: file: #{file}, target: #{target}"
    end
  end
end

desc 'Symlinks all files labeled .zsh to ~/.oh-my-zsh/custom/{dir}_{file}.zsh'
task :customize_zsh do
  require 'pathname'

  files = Dir.glob('**/*{.zsh}')
  symlinks = {}
  files.map do |file|
    pathname = Pathname.new File.expand_path(file)
    next if pathname.directory?
    dirname = pathname.parent.to_s.split("/").last
    basename = pathname.basename
    target = File.expand_path(File.join '~/.oh-my-zsh/custom', "#{dirname}_#{basename}")
    symlinks[pathname.to_s] = target
  end
  symlink_files symlinks
end

desc 'Create symlinks to dotfiles in home directory'
task :symlinks do
  require 'pathname'

  dotfiles_dir = File.expand_path('../', __FILE__)

  symlinks = { dotfiles_dir => File.expand_path(File.join('~', '.dotfiles')) }
  Dir.glob('**/*{.symlink}').each do |file|
    pathname = Pathname.new File.expand_path(file)
    basename = pathname.basename.to_s.gsub(/.symlink$/, '')
    target = File.expand_path(File.join '~', ".#{basename}")
    symlinks[pathname.to_s] = target
  end
  Dir.glob('**/*{.bin}').each do |file|
    pathname = Pathname.new File.expand_path(file)
    next if pathname.directory?
    basename = pathname.basename.to_s.gsub(/.bin$/, '').gsub(".local", "")
    target = File.expand_path(File.join '~/bin', basename)
    symlinks[pathname.to_s] = target
  end

  STDERR.puts "Symlinks: #{symlinks.keys}"

  symlink_files symlinks
end

namespace :vundle do
  desc 'Installs vim bundles'
  task :install => :prepare do
    STDERR.puts 'Updating vim bundles with vundle. This may take a few minutes...'
    `vim -u vim.symlink/bundles.vim +BundleInstall +qall`
  end

  desc 'Install vundler'
  task :prepare do
    unless File.exists?(File.expand_path("~/.vim/bundle/vundle"))
      `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
    end
  end
end

namespace :brew do
  desc 'Installs homebrew'
  task :install do
    if `uname` == 'Darwin'
      `which brew`
      unless $? == 0
        fail <<-oec
You must install homebrew, please run this command:"

  fail %(  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
oec
      end
    end
  end

  desc 'Installs brew packages'
  task :install_packages => :install do
    if `uname` == 'Darwin'
      STDERR.puts "Installing all brews"
      brews = Dir.glob('**/*{.brew}')

      brews.each do |brew_file|
        STDERR.puts "Found brews in #{brew_file}"
        File.open(brew_file).each_line do |brew_package|
          STDERR.puts "Installing #{brew_package}"
          STDERR.puts `brew install #{brew_package}`
        end
      end
    end
  end
end

namespace :utils do
  desc 'Installs ctags 5.8'
  task :ctags do
    STDERR.puts `cd /tmp && wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz`
    STDERR.puts `cd /tmp && tar -xzf ctags-5.8.tar.gz && rm ctags-5.8.tar.gz`
    STDERR.puts `cd /tmp/ctags-5.8 && ./configure && make && sudo make install && cd ../ && rm -Rf ctags-5.8`
  end
end
