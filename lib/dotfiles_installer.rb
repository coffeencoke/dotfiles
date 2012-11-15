class DotfilesInstaller
  attr_reader :replace_all, :dry
  
  def self.call(options={})
    new(options).call
  end
  
  def initialize(options={})
    self.dry = options[:dry] || ENV['dry'] || false
  end
  
  def dry?
    @dry
  end
  
  def dry=(val)
    @dry = val
    puts "\nRunning a dry run...\n\n" if dry?
  end
  
  def call
    symlink_files
    install_janus
  end
  
  def symlink_files
    Dir['*'].reject{|a| %w[Rakefile README.md LICENSE lib].include? a }.each do |file|
      symlink_file(file)
    end
  end
  
  def install_janus
    if home_file_exists?('.vim')
      if replace_all || do_something?("overwrite ~/.vim?")
        rm_file('.vim')
        run_janus_installation
      else
        puts "  -> skipping .vim"
      end
    else
      run_janus_installation
    end
  end
  
  private

  def symlink_file(file)
    destination_file = ".#{file}"
    
    if home_file_exists? destination_file
      if replace_all || do_something?("overwrite ~/#{destination_file}?")
        replace_file(file)
      else
        puts "  -> skipping ~/.#{file}"
      end
    else
      link_file(file)
    end
  end

  def run_janus_installation
    run_system_cmd "Installing janus", %Q{curl -Lo- https://bit.ly/janus-bootstrap | bash}
  end
  
  def do_something?(desc)
    print "#{desc} [ynaq] "
    case $stdin.gets.chomp
    when 'a'
      puts "Set to replace all files without prompt"
      @replace_all = true
      true
    when 'y'
      true
    when 'q'
      exit
    else
      false
    end
  end
  
  def run_system_cmd(description, command)
    puts "  -> #{description}" if description
    system command unless dry?
  end
  
  def home_file_exists?(file)
    File.exist?(File.expand_path(file, home_dir))
  end

  def home_dir
    ENV['HOME']
  end

  def rm_file(file)
    run_system_cmd "Removing file #{file}", %Q{rm -R "#{file}"}
  end

  def replace_file(file)
    rm_file("$HOME/.#{file}")
    link_file(file)
  end

  def link_file(file)
    run_system_cmd "linking ~/.#{file}", %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end