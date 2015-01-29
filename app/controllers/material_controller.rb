class LookUp < Sinatra::Base

  get '/roofs/:id/material/edit' do
    erb :material
  end

  post '/roofs/:id/material' do
    @roof.update(material: params[:material])
    redirect to @roof_route + "shading/edit"
  end

end