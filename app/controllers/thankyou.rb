class LookUp < Sinatra::Base

  get '/thankyou' do
    erb :thankyou
  end

  post '/useremail' do
    redirect to 'http://www.1010global.org/uk'
  end

end
