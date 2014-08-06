# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'statusbot/models/version'

Gem::Specification.new do |spec|
  spec.name          = "statusbot-models"
  spec.version       = Statusbot::Models::VERSION
  spec.authors       = ["Eric Hayes"]
  spec.email         = ["eric@deployfx.com"]
  spec.summary       = %q{Contains the models used by statusbot.}
  spec.description   = %q{Contains all of the models used by statusbot.  Makes it easy for smaller pieces to use the same models.}
  spec.homepage      = "http://www.statusbot.me"
  spec.license       = "MIT"

  spec.files = Dir["{lib,app/models}/**/*"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # gem dependencies
  spec.add_runtime_dependency "activerecord"
  spec.add_runtime_dependency 'standalone_migrations', '~> 2.1.4'
  spec.add_runtime_dependency 'mysql2'

  # development dependencies
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "debugger"
  spec.add_development_dependency "rspec"

end
