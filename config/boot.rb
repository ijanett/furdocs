ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

# Patch for Rails 5.2 / Ruby 3 compatibility error in static middleware
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

# 2. Patch for Sprockets vs JSON 3.x create_additions keyword error
require 'json'
module JSON
  class << self
    alias_method :orig_parse, :parse
    def parse(source, opts = {})
      opts.delete(:create_additions) if opts.is_value? rescue opts.delete(:create_additions)
      orig_parse(source, opts)
    end
  end
end

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.