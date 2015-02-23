class LookUp < Sinatra::Base

  post "/roofs/:id/photo" do
    file = process_image(params)
    @roof.update(photo_url: upload_image(params[:filename]))
    File.delete(file)
    @roof.to_json
  end

end