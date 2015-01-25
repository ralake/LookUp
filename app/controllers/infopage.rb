class LookUp < Sinatra::Base

  get '/infopage' do
    Roof.create_roof(session)
    erb :infopage
  end

end