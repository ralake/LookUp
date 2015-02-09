class LookUp < Sinatra::Base

  post '/roofs/:id/photo' do
    p params
    photo_url = upload_image(params)
    @roof.update(photo_url: photo_url)
  end

  post '/roofs/:id/geolocation' do
    @roof.update(latitude: params[:latitude], longitude: params[:longitude])
  end

  post "/ajax-upload" do
    p params
    data = params[:data]
    filename = params[:filename]
   
    ## Decode the image
    data_index = data.index('base64') + 7
    filedata = data.slice(data_index, data.length)
    decoded_image = Base64.decode64(filedata)

    # p decoded_image
     
    # Write the file to the system
    file = File.new("public/images/user_images/#{filename}", "w+")
    file.write(decoded_image)

    photo_url = upload_image(filename)
    Roof.first.update(photo_url: photo_url)

  end

end