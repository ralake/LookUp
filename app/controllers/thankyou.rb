class LookUp < Sinatra::Base

  get '/thankyou' do
    @roof = Roof.first(id: session[:roof_id])
    erb :thankyou
  end

  post '/useremail' do
    roof = Roof.first(id: session[:roof_id])
    roof.update(user_email: params[:email])
    send_email_with_link(roof)
    redirect to 'http://www.1010global.org/uk'
  end

end
