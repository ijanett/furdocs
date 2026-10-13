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

  # Handle Rails 5.2 initializers that pass keyword arguments as a positional hash in Ruby 3.
  require 'active_model/type/value'

  ActiveModel::Type::Value.prepend(Module.new do
    def initialize(options = nil, **kwargs)
      super(**(options || {}).merge(kwargs))
    end
  end)

  # Fix keyword argument forwarding in the Rails 5.2 PostgreSQL adapter
  require 'active_record/connection_adapters/postgresql/schema_statements'

  ActiveRecord::ConnectionAdapters::PostgreSQL::SchemaStatements.prepend(
    Module.new do
      private

      def create_table_definition(*args, **kwargs)
        ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition.new(
          *args, **kwargs
        )
      end
    end
  )

  # Ruby 3 compatibility for Rails 5.2 column definitions
  require 'active_record/connection_adapters/abstract/schema_definitions'

  ActiveRecord::ConnectionAdapters::TableDefinition.prepend(
    Module.new do
      def new_column_definition(name, type, options = nil, **kwargs)
        super(name, type, **(options || {}).merge(kwargs))
      end
    end
  )

  # Ruby 3 keyword-argument compatibility for Rails 5.2
  require 'active_record/connection_adapters/abstract/schema_creation'

  ActiveRecord::ConnectionAdapters::AbstractAdapter::SchemaCreation.prepend(
    Module.new do
      private

      def type_to_sql(type, options = nil, **kwargs)
        @conn.type_to_sql(type, **(options || {}).merge(kwargs))
      end
    end
  )
end