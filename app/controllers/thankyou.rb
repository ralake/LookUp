class LookUp < Sinatra::Base

  get '/thankyou' do
    erb :thankyou
  end

  post '/useremail' do
    Roof.first(id: session[:roof_id]).update(user_email: params[:email])
    redirect to 'http://www.1010global.org/uk'
  end

end
