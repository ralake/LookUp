class LookUp < Sinatra::Base

  get '/material' do
    erb :material
  end

  post '/material_data' do
    roof = Roof.create(material: params[:material])
    session[:roof_id] = roof.id
    redirect to '/shading'
  end

end