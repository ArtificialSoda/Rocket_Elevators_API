require "ibm_watson"
require "json"
require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson

ActiveAdmin.register_page "Dashboard" do
  content do
    
    authenticator = Authenticators::IamAuthenticator.new(
      apikey: ENV["watson_key"]
    )

    text_to_speech = TextToSpeechV1.new(
        authenticator: authenticator
    )

    text_to_speech.service_url = ENV["watson_url"]
    
    tmp_file = "#{Rails.root}/app/assets/audios/Greet.wav"


    @activeelevators = (Elevator.count - Elevator.where(status: 'Active').count)
    @activeelevatorstext = "#{@activeelevators}"
      if @activeelevators > 1000
        @activeelevatorstext = "#{(@activeelevators/1000).floor} thousand #{@activeelevators%1000}"
      end
      
    diffcities = (Address.where(id: Building.select(:address_id).distinct).select(:city).distinct.count)

    activeuserfirst = Employee.where(admin_user_id: current_admin_user.id).take[:first_name] 
    activeuserlast = Employee.where(admin_user_id: current_admin_user.id).take[:last_name] 

    File.open(tmp_file, "wb") do |audio_file|
        response = text_to_speech.synthesize(
            {
                "text": "Greetings #{activeuserfirst} #{activeuserlast}. Currently #{@activeelevatorstext} elevators are not in running status and are being serviced. There are currently #{(Elevator.count/1000).floor} thousand #{Elevator.count%1000} elevators deployed in the #{Building.count} buildings of your #{Customer.count} customers. You currently have #{Quote.count} quotes awaiting processing. You currently have #{Lead.count} leads in your contact requests #{Battery.count} batteries are deployed across #{diffcities} cities.",
                "accept": "audio/wav",
                "voice": "en-US_AllisonVoice"
            }
        ).result
        audio_file << response
    end

    render partial: 'dashboard'
  end
end
