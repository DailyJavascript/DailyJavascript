require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dailyjavascript
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.time_zone = "Eastern Time (US & Canada)"
    config.active_record.default_timezone = :local

    config.action_mailer.asset_host = "https://www.dailyjavascript.io"

    config.middleware.insert_before ActionDispatch::Static, Rack::Cors do
    	allow do
    		origins 'https://www.dailyjavascript.io', 'http://www.dailyjavascript.io', 'http://dailyjavascript.io', 'https://dailyjavascriptblog.netlify.com'
    		resource '*', headers: :any, methods: [:get, :post, :options, :put, :patch, :delete]
    	end
    end


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
