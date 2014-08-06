require "statusbot/models/version"
require "active_record"
require "yaml"

module Statusbot
  module Models
    # Dependent scripts would need to define their own database connection information
    def self.connect(configuration='config/database.yml', load_models=true)
      environment = ENV['RAILS_ENV'] || 'development'
      project_root = File.dirname(File.absolute_path(__FILE__))

      if load_models
        Dir.glob(File.expand_path(project_root + "/models") + "/*.rb").each{ |f| require f }
      end

      connection_details = YAML::load(File.open(configuration))
      ActiveRecord::Base.establish_connection(connection_details[environment])
    end
  end
end
