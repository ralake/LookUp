class LookUp < Sinatra::Base

  get '/photo' do
    erb :photo
  end

  post '/photo_capture' do
    photo_url = upload_image(params)
    Roof.find_roof(session[:roof_id]).set_photo_url(photo_url)
    redirect to '/material'
  end

  post '/geolocation' do
    Roof.find_roof(session[:roof_id]).set_geolocation(params[:latitude], params[:longitude])
  end

end