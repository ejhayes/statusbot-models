require 'simplecov'

# code coverage
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'debugger'
require 'factory_girl'
require 'faker'
require 'database_cleaner'
require 'statusbot/models'

# I18 deprecation warning - eliminate error
I18n.config.enforce_available_locales = true

# connect to the DB
Statusbot::Models.connect
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