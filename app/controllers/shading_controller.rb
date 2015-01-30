class LookUp < Sinatra::Base 

  get '/roofs/:id/shading/edit' do
    erb :shading
  end

  post '/roofs/:id/shading' do
    @roof.params_parser(params)
    redirect to @roof_route + "measurements/edit"
  end

end