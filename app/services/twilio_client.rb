require 'twilio-ruby'

class TwilioClient
  attr_reader :client

  def initialize
	@client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms (number, message)
    @client.messages.create(
  	  from: '+14159433711',
  	  to: number,
  	  body: message
  	  )
  end

  private

    def account_sid
      Rails.application.credentials.twilio[:account_sid]
    end

    def auth_token
      Rails.application.credentials.twilio[:auth_token]
    end
    
end