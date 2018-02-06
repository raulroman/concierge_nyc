require 'twilio-ruby'


account_sid = ""
auth_token = ""

@client = Twilio::REST::Client.new account_sid, auth_token

@client.api.account.messages.create(
    
