class LookUp < Sinatra::Base

  post '/roofs/:id/photo' do
    photo_url = upload_image(params)
    @roof.update(photo_url: photo_url)
  end

  post '/roofs/:id/geolocation' do
    @roof.update(latitude: params[:latitude], longitude: params[:longitude])
  end

end