class LookUp < Sinatra::Base

  get '/roofs/:id/measurements/edit' do
    erb :measurements
  end

  get '/roofs/:id' do
    Roof.first(id: params[:id]).to_json
  end

  post '/roofs/:id/measurements' do
    format_measurments(params)
    @roof.update(angled_edge: params[:angled_edge], gutter_edge: params[:gutter_edge])
    redirect to "/roofs/#{params[:id]}/capacity/edit"
  end

end