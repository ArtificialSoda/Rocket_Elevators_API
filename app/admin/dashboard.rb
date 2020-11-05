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

    File.open(tmp_file, "wb") do |audio_file|
        response = text_to_speech.synthesize(
            {
                "text": "William",
                "accept": "audio/wav",
                "voice": "en-US_AllisonVoice"
            }
        ).result
        audio_file << response
    end

    render partial: 'dashboard'
  end
end
