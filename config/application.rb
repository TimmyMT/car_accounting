require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module CarAccounting
  class Application < Rails::Application
    config.load_defaults 6.0

    config.autoload_paths += [config.root.join('app')]
  end
end
