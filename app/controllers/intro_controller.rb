class LookUp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/roofs/new' do
    roof = Roof.create
    reverse_bearing(params) && roof_direction(params[:orientation])
    roof.params_parser(params)
    roof.to_json
  end

  post '/roofs/:id/geolocation/edit' do
    @roof.params_parser(params)
    @roof.to_json
  end

end