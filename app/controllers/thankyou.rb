class LookUp < Sinatra::Base

  get '/thankyou' do
    @roof = Roof.find_roof(session[:roof_id])
    erb :thankyou
  end

  post '/useremail' do
    roof = Roof.find_roof(session[:roof_id])
    roof.add_user_email(params[:email])
    mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    message_params = {from: ENV['MAILGUN_FROM_ADDRESS'], 
                      to: "#{roof.user_email}",
                      subject: "Lookup.solar link",
                      text: "Hi #{roof.discovered_by}!\n
                            Please follow the link below on a desktop computer to complete the process.\n
                            https://lookupdev.herokuapp.com?id=#{roof.id}"
    }
    mg_client.send_message "#{ENV['MAILGUN_SANDBAG']}", message_params
    puts mg_client
    redirect to 'http://www.1010global.org/uk'
  end

end
