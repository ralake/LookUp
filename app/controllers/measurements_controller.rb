class LookUp < Sinatra::Base

  get '/roofs/:id/measurements/edit' do
    erb :measurements
  end

  get '/roofs/:id' do
    Roof.first(id: params[:id]).to_json
  end

  post '/roofs/:id/measurements' do
    format_measurments(params)
    @roof.params_parser(params)
    redirect to @roof_route + "capacity/edit"
  end

end