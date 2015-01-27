class LookUp < Sinatra::Base

  get '/desktop/:id' do
    @roof = Roof.first(id: params[:id])
    erb :desktop
  end

  get '/desktop/json/:id' do
    roof = Roof.first(id: params[:id])
    {"latitude" => roof.latitude, "longitude" => roof.longitude}.to_json
  end

end
