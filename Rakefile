require "bundler/gem_tasks"

Bundler::GemHelper.install_tasks

task :default => :test

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = FileList['test/*_test.rb']
  test.verbose = true
  # test.warning = true
end

namespace :test do
  Rake::TestTask.new(:unit) do |test|
    test.libs << 'lib' << 'test'
    test.pattern = 'test/*_test.rb'
    test.verbose = true
  end
end
