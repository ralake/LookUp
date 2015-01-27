class LookUp < Sinatra::Base

  get '/desktop/:id' do
    @roof = Roof.find(params[:id])
    erb :desktop
  end

  get '/desktop/json/:id' do
    roof = Roof.find(params[:id])
    {"latitude" => roof.latitude, "longitude" => roof.longitude}.to_json
  end

  post '/desktop/data' do
    Roof.find(session[:roof_id]).update(angled_edge: params[:angled_edge], gutter_edge: params[:gutter_edge])
    redirect to '/result'
  end

end
