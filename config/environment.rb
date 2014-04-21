# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Blocitoff::Application.initialize! do

config.gem 'javan-whenever', :lib => false, :source => 'http://gems.github.com'

end