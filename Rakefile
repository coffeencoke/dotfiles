require 'rake'

task :default => [:symlinks, 'vundle:install', 'brew:install']

desc 'Create symlinks to dotfiles in home directory'
task :symlinks do
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
  task :install do
    puts 'Updating vim bundles with vundle. This may take a few minutes...'
    `vim -u vim.symlink/bundles.vim +BundleInstall +qall`
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
