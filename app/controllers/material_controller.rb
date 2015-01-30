class LookUp < Sinatra::Base

  get '/roofs/:id/material/edit' do
    erb :material
  end

  post '/roofs/:id/material' do
    @roof.params_parser(params)
    redirect to @roof_route + "shading/edit"
  end

end