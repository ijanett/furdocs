ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

# Patch for Rails 5.2 / Ruby 3 compatibility error in static middleware
require 'action_dispatch/middleware/static'
module ActionDispatch
  class Static
    prepend Module.new {
      def initialize(app, path, index: 'index', headers: {})
        super(app, path, index: index, headers: headers)
      end
    }
  end
end

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.