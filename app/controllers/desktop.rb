class LookUp < Sinatra::Base

  get '/desktop/:geolocation' do
    erb :desktop
  end

end
