class LookUp < Sinatra::Base

  get '/result' do
    @roof = Roof.find(session[:roof_id])
    p @roof
    erb :result
  end

end