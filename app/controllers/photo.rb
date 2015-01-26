class LookUp < Sinatra::Base

  get '/photo' do
    erb :photo
  end

  post '/photo_capture' do
    # photo_url = upload_image(params)
    # Roof.find_roof(session[:roof_id]).add_photo_url(photo_url)
    redirect to '/material'
  end

  post '/geolocation' do
    p params
    Roof.find_roof(session[:roof_id]).add_geolocation(params[:latitude], params[:longitude])
  end

end