ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

# Patch for Rails 5.2 / Ruby 3 compatibility error in static middleware
require 'action_dispatch/middleware/static'
module ActionDispatch
  class Static
    def initialize(app, path, options = {})
      @app = app
      index = options[:index] || 'index'
      headers = options[:headers] || {}
      @file_handler = FileHandler.new(path, index: index, headers: headers)
    end
  end
end

# Patch for Ruby 3 Psych YAML database alias parsing failure
require 'yaml'
if defined?(Psych) && Psych.respond_to?(:safe_load)
  module Psych
    class << self
      alias_method :orig_safe_load, :safe_load
      def safe_load(yaml, *args, **kwargs)
        if kwargs.empty? && args.empty?
          orig_safe_load(yaml, aliases: true)
        else
          kwargs[:aliases] = true
          orig_safe_load(yaml, *args, **kwargs)
        end
      end
    end
  end
end

# Patch for Rails 5.2 ActiveRecord connection initialization on Ruby 3
require 'active_record/type/adapter_specific_registry'
module ActiveRecord
  module Type
    class AdapterSpecificRegistry
      prepend Module.new {
        def add_modifier(*args, **kwargs)
          if kwargs.empty?
            super(*args)
          else
            super(*args, **kwargs)
          end
        end
      }
    end
  end
end

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.