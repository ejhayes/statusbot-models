require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'standalone_migrations'

StandaloneMigrations::Tasks.load_tasks

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc 'Interactive console with gem pre-loaded'
task :console => :environment do
  require 'irb'
  require 'irb/completion'
  require 'ruby-debug'
  $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
  require 'statusbot/models'
  ARGV.clear
  IRB.start
end