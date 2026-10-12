ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

# Patch for Rails 5.2 / Ruby 3 compatibility error in static middleware
require 'action_dispatch/middleware/static'
module ActionDispatch
  class Static
    prepend Module.new {
      extend RubyVM::AbstractSyntaxTree rescue nil #fallback

      ruby2_keywords def initialize(*args)
        super(*args)
      end
    }
  end
end

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.