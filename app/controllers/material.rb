class LookUp < Sinatra::Base

  get '/material' do
    erb :material
  end

  post '/material_data' do
    Roof.first(id: session[:roof_id]).update(material: params[:material])
    redirect to '/shading'
  end

end
