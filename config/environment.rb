# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Specify gems that this application depends on and have them installed with rake gems:install
  config.gem 'twitter', :version => '0.7.11'
  config.gem 'will_paginate', :version => '~> 2.3.11', :source => 'http://gemcutter.org'
  config.gem 'compass'
  config.gem 'compass-960-plugin', :lib => false
  config.gem "simple-navigation", :lib => "simple_navigation"
  config.gem "jrails"
  config.gem 'formtastic'
  config.gem 'jintastic'
  config.gem 'responders', :version => "= 0.4.2"
  config.gem 'inherited_resources', :version => "= 1.0.2"
  config.gem 'newrelic_rpm'
  
  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # Default locale
  config.i18n.default_locale = :mk
end