# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'localhost:3000',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
