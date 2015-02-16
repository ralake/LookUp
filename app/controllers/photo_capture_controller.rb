class LookUp < Sinatra::Base

  post "/roofs/:id/photo" do

    data = params[:data]
    filename = params[:filename]
   
    ## Decode the image
    data_index = data.index('base64') + 7
    filedata = data.slice(data_index, data.length)
    decoded_image = Base64.decode64(filedata)

    # Write the file to the system
    file = File.new("public/images/user_images/#{filename}", "w+")
    file.write(decoded_image)

    # upload file
    photo_url = upload_image(filename)
    @roof.update(photo_url: photo_url)
    File.delete(file)
    @roof.to_json
  end

end