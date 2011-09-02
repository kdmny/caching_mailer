require 'rubygems'
require 'rake'
require 'bundler'
Bundler.setup
Bundler.require

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "caching_mailer"
    gemspec.summary = "Adds fragment caching to ActionMailer"
    gemspec.description = "Uses ActionController to provide fragment caching to ActionMailer"
    gemspec.email = "stalkingtiger@gmail.com"
    gemspec.homepage = "http://github.com/aughr/caching_mailer"
    gemspec.authors = ["Mike Demers", "Andrew Bloomgarden"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: bundle install"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "resource_defaults #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc 'Default: run unit tests.'
task :default => :test

require 'rake/testtask'
desc 'Test the caching_mailer plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end
