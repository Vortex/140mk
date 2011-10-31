require 'compass'
  # If you have any compass plugins, require them here.
require 'compass-colors'
require 'fancy-buttons'

  Compass.add_project_configuration(File.join(RAILS_ROOT, "config", "compass.rb"))
  Compass.configuration.environment = RAILS_ENV.to_sym
  Compass.configure_sass_plugin!
