class UserNotifierMailer < ApplicationMailer
    default :from => 'xynnax6@gmail.com'

    # Send a greeting email to user when completing a Contact Us form
    def send_greeting_email(lead)
      @lead = lead
      mail( :to => @lead.email,
      :subject => 'Rocket Elevators - Thank You For Contacting Us!' )
    end
end
