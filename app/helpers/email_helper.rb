def send_email_with_link(roof)
  mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
  message_params = {from: ENV['MAILGUN_FROM_ADDRESS'], 
                    to: "#{roof.user_email}",
                    subject: "Lookup.solar Results",
                    text: email_body(roof)
  }
  mg_client.send_message "#{ENV['MAILGUN_SANDBAG']}", message_params
end

def email_body(roof)
  "Hi #{roof.discovered_by}!\n
  Based on the information that we gathered during your survey,\n
  we think that the roof can hold #{roof.panel_capacity} panels.\n
  This could generate an estimated power output of #{roof.power_capacity}kw.\n
  Please give us a call at the 10:10 office to find out more about the next steps!"
end

def email_validation(roof)
  return valid_email(roof) if (roof.user_email != "" && roof.save)
  redirect to 'http://www.1010global.org/uk' if roof.user_email == ""
  invalid_email(roof)
end

def valid_email(roof)
  send_email_with_link(roof) 
  redirect to 'http://www.1010global.org/uk'
end

def invalid_email(roof)
  flash[:error] = roof.errors.full_messages
end