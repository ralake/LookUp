class LookUp < Sinatra::Base

  get '/photo' do
    erb :photo
  end

end