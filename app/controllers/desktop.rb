class LookUp < Sinatra::Base

  get '/desktop/:id' do
    @roof = Roof.find_roof(params[:id])
    erb :desktop
  end

  get '/desktop/json/:id' do
    roof = Roof.find_roof(params[:id])
    {"latitude" => roof.latitude, "longitude" => roof.longitude}.to_json
  end
end
