class LookUp < Sinatra::Base 

  get '/roofs/:id/shading/edit' do
    erb :shading
  end

  post '/roofs/:id/shading' do
    @roof.update(shade_value: params[:shade_value].to_i)
    redirect to @roof_route + "measurements/edit"
  end

  post '/roofs/:id/angle' do
    @roof.update(roof_angle: params[:sloped_angle].to_i)
    redirect to @roof_route + "photo/edit"
  end

end