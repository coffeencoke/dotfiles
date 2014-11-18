# For general help with Ruby packages, see
# https://w.amazon.com/index.php/Ruby/QuickStart
#
# For help with Brazil Rakefiles, see
# https://w.amazon.com/index.php/BrazilRake

require 'brazil'
require 'brazil/librarypackagetask'
require 'brazil/copysrctask'
require 'brazil/rspectask'
require 'brazil/rubysyntaxtask'

desc "Copy libraries from lib/"
Brazil::LibraryPackageTask.new

# You may remove this task if your package doesn't provide scripts
desc "Copy scripts from bin/"
Brazil::CopySrcTask.new("bin") do |t|
  t.excludes << 'README'
end
task :all => :bin

desc "Run unit tests in spec/"
Brazil::RSpecTask.new(:test, 'spec/')

task :test => :spec

# You may remove this task if you don't want syntax checking during build
desc "Syntax-check bin/ and lib/"
Brazil::RubySyntaxTask.new do |task|
  task.files.
    include('lib/**/*.rb').
    include('bin/**/*').
    exclude('bin/README')
end
task :all => :syntax