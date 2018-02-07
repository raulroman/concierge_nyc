require 'sinatra'
require 'twilio-ruby'


post "/sms" do 
  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message "Got the message"
  end

  content_type "text/xml"

  twiml.to_s

end