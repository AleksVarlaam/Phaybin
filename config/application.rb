# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Phaybin
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.exceptions_app = lambda { |env|
      ErrorsController.action(:show).call(env)
    }

    # ActiveJob adapter
    config.active_job.queue_adapter = :sidekiq

    # TimeZone
    config.time_zone = 'Asia/Jerusalem'

    # I18n
    config.i18n.available_locales = %i[he en uk ru]
    config.i18n.default_locale = :ru
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Active storage
    config.active_storage.replace_on_assign_to_many = false
  end
end
