class LookUp < Sinatra::Base

  get '/material' do
    erb :material
  end

  post '/material_data' do
    roof = Roof.first(:id => session[:roof_id])
    roof.update(material: params[:material])
    redirect to '/shading'
  end

end