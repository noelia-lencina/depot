# Load the Rails application.
require_relative 'application'

Depot::Application.configure do 
  config.action_mailer.delivery_method = :test

end
# Initialize the Rails application.
Rails.application.initialize!
