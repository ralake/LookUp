def send_user_email(roof)
  mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
  message_params = {from: ENV['MAILGUN_FROM_ADDRESS'], 
                    to: "#{roof.user_email}",
                    subject: subject_text(roof),
                    text: body_text(roof)
  }
  mg_client.send_message "#{ENV['MAILGUN_SANDBAG']}", message_params
end

def send_feedback_email(msg)
  mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
  message_params = {from: ENV['MAILGUN_FROM_ADDRESS'], 
                    to: ENV['LOOKUP_EMAIL_ADDRESS'],
                    subject: "Lookup.solar Feedback",
                    text: msg
  }
  mg_client.send_message "#{ENV['MAILGUN_SANDBAG']}", message_params
end

def subject_text(roof)
  if first_time_user?(roof.user_email)
    return "Welcome to Look Up! Here’s your first report."
  else
    "Here's your latest Look Up discovery!"
  end
end

def body_text(roof)
  if first_time_user?(roof.user_email)
    first_time_user_email_body(roof)
  else
    repeat_user_email_body(roof)
  end
end

def first_time_user_email_body(roof)
  "Hi #{roof.user_email}, congratulations on your first Look Up discovery!\n 
  Here’s the full report – you should probably print it out and frame it or something.\n
  - #{roof.panel_capacity} panels should fit on the roof.\n
  - This could generate #{roof.power_capacity} kWp, enough to power #{roof.homes_to_power} homes!\n
  What next?\n
  You've found a good-looking roof - now let's put some solar panels on it!\n
  If there's a community energy group nearby, they'll be able to see your report, and maybe host their next solar rig on the roof you found!\n
  No groups near you? Get tips on starting one here: xxxx
  Not your thing? Keep snapping those roofs anyway. The more there are in the database, the easier it'll be for someone else to get something going later on.\n
  The Look Up team"
end

def repeat_user_email_body(roof)
  "Hi #{roof.user_email},\n
  Looks like you've found another promising solar roof on Look Up. Nice work!\n
  Here's your report:
  - #{roof.panel_capacity} panels should fit on the roof.\n
  - This should generate #{roof.power_capacity}, enough to power #{roof.homes_to_power} homes!\n
  You can see your other discoveries at lookup.solar.\n
  Keep hunting!\n
  The Look Up team"
end

def email_validation(roof)
  return valid_email(roof) if (roof.user_email != "" && roof.save)
  return roof.to_json if roof.user_email == ""
  invalid_email(roof)
end

def valid_email(roof)
  send_user_email(roof)
  roof.to_json 
end

def invalid_email(roof)
  {"errors" => roof.errors.full_messages}.to_json
end

def first_time_user?(email)
  Roof.all(user_email: email).length == 1
end