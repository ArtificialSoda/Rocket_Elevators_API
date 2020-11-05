# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

:development
  ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey',
    :password => ENV['sendgrid_password'],
    :domain => 'localhost:3000',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }

:production
  ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey',
    :password => ENV['sendgrid_password'],
    :domain => 'rocket-elevators.ca',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }


