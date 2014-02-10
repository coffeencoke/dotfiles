require 'rake'

task :default => ['oh_my_zsh:install', :symlinks, 'vundle:install', 'brew:install']

namespace :oh_my_zsh do
  desc 'Installs oh my zsh'
  task :install do
    if File.exists?(File.expand_path("~/.oh-my-zsh"))
      puts "oh-my-zsh seems to already be installed, overwrite? (Y/n)"
      answer = STDIN.gets.chomp.downcase
      unless ["", "y", "yes", "ya"].include?(answer)
        puts "Fine, be that way"
        next
      end
    end

    puts "Installing oh-my-zsh"
    `curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh`
    puts "zsh installed successfully" if $?
  end
end

desc 'Create symlinks to dotfiles in home directory'
task :symlinks do

  `ln -sf $PWD ~/.dotfiles`

  links = Dir.glob('**/*{.symlink}')

  skip_all = false
  overwrite_all = false
  backup_all = false

  links.each do |link_source|
    overwrite = false
    backup = false

    file = link_source.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end

    `ln -s "$PWD/#{link_source}" "#{target}"` if !skip_all
  end
end

namespace :vundle do
  desc 'Installs vim bundles'
  task :install => :prepare do
    puts 'Updating vim bundles with vundle. This may take a few minutes...'
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
  desc 'Installs brew packages'
  task :install do
    puts "Installing all brews"
    brews = Dir.glob('**/*{.brew}')

    brews.each do |brew|
      brew_pkg_name = File.read(brew)
      puts "Installing #{brew_pkg_name}"
      `brew install #{brew_pkg_name}`
    end
  end
end
