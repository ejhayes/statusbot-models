class Engine < ::Rails::Engine
  isolate_namespace Statusbot::Models
end