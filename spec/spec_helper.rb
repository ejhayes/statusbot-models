require 'simplecov'

# code coverage
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'debugger'
require 'statusbot/models'
