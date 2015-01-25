class LookUp < Sinatra::Base

  get '/thankyou' do
    erb :thankyou
  end

  post '/useremail' do
    Roof.add_user_email(session, params)
    redirect to 'http://www.1010global.org/uk'
  end

end
