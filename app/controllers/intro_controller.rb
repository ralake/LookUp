class LookUp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/roofs/:id' do
    Roof.first(id: params[:id]).to_json
  end

  post '/roofs/new' do
    roof = Roof.create
    # roof_direction(params[:orientation])
    roof.params_parser(params)
    roof.to_json
  end

  post '/roofs/:id/geolocation' do
    @roof.params_parser(params)
    @roof.to_json
  end

end