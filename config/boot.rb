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