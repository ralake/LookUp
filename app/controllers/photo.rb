class LookUp < Sinatra::Base

  get '/photo' do
    erb :photo
  end

  post '/photo_capture' do
    photo_url = upload_image(params)
    roof = Roof.create(:photo_url => photo_url)
    session[:roof_id] = roof.id
    redirect to '/material'
  end

end