class LookUp < Sinatra::Base

  get '/desktop/:latitude/:longitude' do
    erb :desktop
  end

end
