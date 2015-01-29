class LookUp < Sinatra::Base

   get '/roofs/:id/start' do
     erb :angle
   end

  post '/roofs/:id/flat' do
    roof_facing(set_azimuth(params[:flat_orientation]))
    @roof.update_flat_roof_data(0, params[:flat_orientation])
    redirect to @roof_route + "photo/edit"
  end

  post '/roofs/:id/sloped' do
    roof_facing(set_azimuth(params[:sloped_orientation]))
    @roof.update_sloped_roof_orientation(params[:sloped_orientation])
    redirect to @roof_route + "sloped/edit"
  end

  get '/roofs/:id/sloped/edit' do
    erb :sloped_roof
  end

  post '/roofs/:id/angle' do
    @roof.update(roof_angle: params[:sloped_angle].to_i)
    redirect to @roof_route + "photo/edit"
  end

end