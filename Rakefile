require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'standalone_migrations'

StandaloneMigrations::Tasks.load_tasks

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc 'Interactive console with gem pre-loaded'
task :console do
  require 'irb'
  require 'irb/completion'
  require 'ruby-debug'
  $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
  
  # connect to the db
  require 'statusbot/models'
  Statusbot::Models.connect

  # so we have some models to play with
  require 'factory_girl'
  require 'faker'
  Dir.glob("./spec/factories/*.rb").each { |f| require f }

  ARGV.clear
  puts "Console Ready! (note: all factories and models are loaded)"
  IRB.start
end
