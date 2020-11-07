# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# domain 
# if Rails.env == "development"
#   domain = 'localhost:3000'
# elsif Rails.env == "production"
#   domain = 'rocket-elevators.ca'
# end

# p domain 
# p "--------------"


ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => ENV['sendgrid_password'],
  :domain => request.domain,
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

# :production
#   ActionMailer::Base.smtp_settings = {
#     :user_name => 'apikey',
#     :password => ENV['sendgrid_password'],
#     :domain => 'rocket-elevators.ca',
#     :address => 'smtp.sendgrid.net',
#     :port => 587,
#     :authentication => :plain,
#     :enable_starttls_auto => true
#   }


