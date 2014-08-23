# Code coverage
# Travis: use code climate
# Everything else: simplecov
if ENV['RAILS_ENV'] == 'travis'
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
else
  require 'simplecov'
  SimpleCov.start
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'debugger'
require 'date'
require 'factory_girl'
require 'faker'
require 'database_cleaner'

# Important: this should stay above the shoulda-matchers
require 'statusbot/models'

# IMPORTANT: the matchers wind up monkey patching
# part of the database. therefore it is important that
# ActiveRecord is loaded BEFORE we load the matching
# library
require 'shoulda/matchers'

# Ensure that we also test the keys added with foreigner
require 'foreigner'
require 'foreigner-matcher'

# I18 deprecation warning - eliminate error
I18n.config.enforce_available_locales = true

# connect to the DB
Statusbot::Models.connect

# And load the foreigner library
Foreigner.load

Dir.glob("./spec/factories/*.rb").each { |f| require f }

RSpec.configure do |config|
  # Factory Girl
  config.include FactoryGirl::Syntax::Methods

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end