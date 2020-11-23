require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Eventkam
  class Application < Rails::Application
    
    config.action_mailer.default_url_options = { host: 'http://bishop-samurai.herokuapp.com/', protocol: 'http' }
  
    config.exceptions_app = self.routes
    config.assets.initialize_on_precompile = false

    config.load_defaults 6.0
    
    config.generators do |g|
      g.assets false
      g.helper false
      g.jbuilder false
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end

  end
end
