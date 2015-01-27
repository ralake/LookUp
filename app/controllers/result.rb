class LookUp < Sinatra::Base

  get '/result' do
    @roof = Roof.first(id: session[:roof_id])
    @roof.set_capacities
    erb :result
  end

end