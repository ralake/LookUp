class LookUp < Sinatra::Base

  get '/photo' do
    erb :photo
  end

  post '/photo_capture' do
    photo_url = upload_image(params)
    Roof.first(id: session[:roof_id]).update(photo_url: photo_url)
    redirect to '/material'
  end

  post '/geolocation' do
    Roof.first(id: session[:roof_id]).update(latitude: params[:latitude], longitude: params[:longitude])
  end

end