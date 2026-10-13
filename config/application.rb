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

# Temporary compatibility workaround for Rails 5.2
# and Ruby 3 keyword argument forwarding.
ActiveSupport.on_load(:active_record) do
  ActiveRecord::Type.define_singleton_method(:add_modifier) do |options, klass, **kwargs|
    registry.add_modifier(options, klass, **kwargs)
  end

  # Fix Integer type initialization under Ruby 3
  ActiveModel::Type::Integer.class_eval do
    def initialize(**kwargs)
      super(**kwargs)
      @range = min_value...max_value
    end
  end
end