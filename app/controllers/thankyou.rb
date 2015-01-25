class LookUp < Sinatra::Base

  get '/thankyou' do
    erb :thankyou
  end

  post '/useremail' do
    Roof.find_roof(session[:roof_id]).add_user_email(params[:email])
    redirect to 'http://www.1010global.org/uk'
  end

end
