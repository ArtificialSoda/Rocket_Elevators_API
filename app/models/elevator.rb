require 'twilio-ruby'
require 'slack-notifier'

class Elevator < ApplicationRecord
    belongs_to :column
    belongs_to :customer
    
    after_update do |e|
        if e.status == 'intervention'
            account_sid = "SECRETOFLIFE" # Your Test Account SID from www.twilio.com/console/settings
            auth_token = "SECRETOFLIFE"   # Your Test Auth Token from www.twilio.com/console/settings
            
            @client = Twilio::REST::Client.new account_sid, auth_token
            message = @client.messages.create(
                body: "The Elevator #{e.id} has just changed status to intervention.",
                to: "SECRETOFLIFE",    # Replace with your phone number
                from: "+16475608952")  # Use this Magic Number for creating SMS
            
            puts message.sid
        end    
    end


    around_update :notify_system_if_status_is_changed

    def notify_system_if_status_is_changed
        status_changed = self.status_changed?
        if status_changed
            notifier = Slack::Notifier.new Rails.application.credentials.slack[:token]
            notifier.ping "The elevator #{self.id} with serial number #{self.serial_number} changed status from #{self.status_was} to #{self.status}"
        end
        yield
    end
end
