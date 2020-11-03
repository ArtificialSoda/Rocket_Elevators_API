require 'twilio-ruby'

class Elevator < ApplicationRecord
    belongs_to :column
    belongs_to :customer
    
    after_update do |e|
        if e.status = 'intervention' 
            account_sid = "ITSASECRET" # Your Test Account SID from www.twilio.com/console/settings
            auth_token = "ADEADLYSECRET"   # Your Test Auth Token from www.twilio.com/console/settings
            
            @client = Twilio::REST::Client.new account_sid, auth_token
            message = @client.messages.create(
                body: "An elevator has just changed status to intervention.",
                to: "COVID19",    # Replace with your phone number
                from: "+16475608952")  # Use this Magic Number for creating SMS
            
            puts message.sid
        end    
    end
end
