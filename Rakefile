require 'rake'
require 'rake/rdoctask'
 
desc 'Generate documentation for flickr_fu.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'flickr_fu'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# RSpec support
begin
  require 'spec'
rescue LoadError
  require 'rubygems'
  require 'spec'
end
begin
  require 'spec/rake/spectask'
rescue LoadError
  puts <<-EOS
	  To use rspec for testing you must install rspec gem:
	  gem install rspec
  EOS
  exit(0)
end

task :default => :spec

spec_common = Proc.new do |t|
  t.spec_opts = ['--options', "spec/spec.opts"]
  t.spec_opts << ['--options', "spec/spec.local.opts" ] if File.exist?(File.dirname(__FILE__) + "/spec/spec.local.opts")
  t.spec_files = FileList['spec/**/*_spec.rb']
end

desc "Run the specs under spec/models"
Spec::Rake::SpecTask.new do |t|
  spec_common.call(t)
end

desc "Analyze code coverage with tests"
Spec::Rake::SpecTask.new("rcov") do |t|
  spec_common.call(t)
  t.rcov = true
  t.rcov_opts = ["-x", "/var/lib", "-x", "spec/", "-T"]
end