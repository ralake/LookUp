class LookUp < Sinatra::Base

  get '/infopage' do
    erb :infopage
  end

end