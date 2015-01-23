class LookUp < Sinatra::Base

  get '/photo' do
    erb :photo
  end

  post '/photo_capture' do
    photo_url = upload_image(params)
    roof = Roof.first(:id => session[:roof_id])
    roof.update(:photo_url => photo_url)
    redirect to '/material'
  end

  post '/geolocation' do
    p params
  end

end