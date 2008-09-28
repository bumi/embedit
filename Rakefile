require 'rake'
require File.join(File.dirname(__FILE__), 'spec', 'spec_helper')
require "spec/rake/spectask"

desc "Run all specs"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec/*.rb']
  t.rcov = false
end
task :default => :spec