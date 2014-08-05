# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'statusbot/models/version'

Gem::Specification.new do |spec|
  spec.name          = "statusbot-models"
  spec.version       = Statusbot::Models::VERSION
  spec.authors       = ["Eric Hayes"]
  spec.email         = ["eric@deployfx.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # gem dependencies
  spec.add_runtime_dependency "typhoeus", "~> 0.6.7"
  spec.add_runtime_dependency "colorize", "~> 0.6.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

end
