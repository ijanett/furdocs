ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'logger' # Load Logger before Rails/Active Support
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.

# Temporary compatibility patch:
# Originally added for Rails 5.2 / Ruby 3 static middleware
require 'action_dispatch/middleware/static'

module ActionDispatch
  class Static
    def initialize(app, path, options = {})
      @app = app
      index = options[:index] || "index"
      headers = options[:headers] || {}
      @file_handler = FileHandler.new(path, index: index, headers: headers)
    end
  end
end

# Temporary compatibility patch:
# Originally added for Sprockets / JSON keyword-argument handling
require 'json'

module JSON
  class << self
    alias_method :orig_parse, :parse
    def parse(source, *args, **kwargs)
      kwargs.delete(:create_additions)
      if kwargs.empty?
        orig_parse(source, *args)
      else
        orig_parse(source, *args, **kwargs)
      end
    end
  end
end