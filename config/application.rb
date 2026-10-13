require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FurDocs
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    
    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = :local
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

ActiveSupport.on_load(:active_record) do
  require 'active_record/type/adapter_specific_registry'
  ActiveRecord::Type::AdapterSpecificRegistry.prepend(Module.new {
    def add_modifier(*args, **kwargs)
      if kwargs.empty?
        super(*args)
      else
        super(*args, **kwargs)
      end
    end
  })
end