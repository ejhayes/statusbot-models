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
  spec.homepage      = "https://github.com/ejhayes/statusbot-models"
  spec.license       = "MIT"

  spec.files = Dir["{lib,app,db/migrate,bin}/**/*","Rakefile.gem"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  # gem dependencies
  spec.add_runtime_dependency "activerecord"
  spec.add_runtime_dependency 'ejhayes_standalone_migrations', '~> 2.2.0'
  spec.add_runtime_dependency 'mysql2'
  spec.add_runtime_dependency 'sqlite3'
  spec.add_runtime_dependency 'foreigner'

  # development dependencies
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "debugger"
  spec.add_development_dependency "rspec", "~> 2.14.1"
  spec.add_development_dependency 'shoulda-matchers'
  spec.add_development_dependency 'simplecov', '~> 0.7.1'
  spec.add_development_dependency "foreigner-matcher"
  spec.add_development_dependency "factory_girl"
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'foreigner-matcher', '~> 0.3.0'
end
