require "statusbot/models/version"
require "active_record"
require "yaml"

# Do not load this library if this is not rails
if defined?(Rails)
  require "foreigner"
  require "statusbot/models/engine"
end

module Statusbot
  module Models
    class MissingConfigurationError < StandardError
    end

    def self.connect(configuration='db/config.yml', load_models=true)
      environment = ENV['RAILS_ENV'] || 'development'
      project_root = File.dirname(File.absolute_path(__FILE__))

      unless File.exist?(configuration)
        raise MissingConfigurationError.new("could not find '#{configuration}'")
      end

      if load_models
        Dir.glob(File.expand_path(project_root + "/../../app/models") + "/*.rb").each{ |f| require f }
      end


      connection_details = YAML::load(File.open(configuration))
      ActiveRecord::Base.establish_connection(connection_details[environment])
    end
  end
end
