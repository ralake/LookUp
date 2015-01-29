class LookUp < Sinatra::Base

  get '/roofs/:id/photo/edit' do
    erb :photo
  end

  post '/roofs/:id/photo' do
    photo_url = upload_image(params)
    @roof.update(photo_url: photo_url)
    redirect to "/roofs/#{params[:id]}/material/edit"
  end

  post '/roofs/:id/geolocation' do
    @roof.update(latitude: params[:latitude], longitude: params[:longitude])
  end

end