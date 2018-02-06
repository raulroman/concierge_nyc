require 'sinatra'
require 'twilio-ruby'


post "/sms" do 
  client = Twilio::TwiML::MessagingResponse.new do |r|
    r.message "Got the message"
  end

  content_type "text/xml"

  client.to_s

end