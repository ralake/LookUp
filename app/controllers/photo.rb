class LookUp < Sinatra::Base

  get '/photo' do
    erb :photo
  end

  post '/photo_capture' do
    photo_url = upload_image(params)
    Roof.add_photo_url(session)
    redirect to '/material'
  end

  post '/geolocation' do
    Roof.add_geolocation(session, params)
  end

end