class LookUp < Sinatra::Base

  get '/result' do
    @roof = Roof.find_roof(session[:roof_id])
    erb :result
  end

end