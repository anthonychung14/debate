require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Debate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.assets.initialize_on_precompile = false

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.api_only = true

    # https://medium.com/@admatbandara/setting-up-cors-to-my-rails-api-a6184e461a0f
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "localhost:3000", '127.0.0.1:3000', 'https://provisor-0-1.firebaseapp.com/'
        resource(
          "*",
          headers: :any,
          methods: [:get, :patch, :put, :delete, :post, :options],
        )
      end
    end
  end
end
