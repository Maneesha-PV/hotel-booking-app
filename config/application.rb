require_relative 'boot'
require_relative '../lib/timer' 

require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HotelBooking
  class Application < Rails::Application
  	#config.middleware.use 'Timer'
  	config.middleware.insert_before Rack::Sendfile, 'Timer'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  	config.active_job.queue_adapter = :sidekiq
  end

end
