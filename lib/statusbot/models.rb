require "statusbot/models/version"
require "active_record"
require "yaml"

# Do not load this library if this is not rails
if defined?(Rails)
  require "statusbot/models/engine"
end

module Statusbot
  module Models
    # Dependent scripts would need to define their own database connection information
    def self.connect(configuration='db/config.yml', load_models=true)
      environment = ENV['RAILS_ENV'] || 'development'
      project_root = File.dirname(File.absolute_path(__FILE__))

      if load_models
        Dir.glob(File.expand_path(project_root + "/../../app/models") + "/*.rb").each{ |f| require f }
      end

      connection_details = YAML::load(File.open(configuration))
      ActiveRecord::Base.establish_connection(connection_details[environment])
    end
  end
end
