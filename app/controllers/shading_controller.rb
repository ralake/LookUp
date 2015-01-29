class LookUp < Sinatra::Base 

  get '/roofs/:id/shading/edit' do
    erb :shading
  end

  post '/roofs/:id/shading' do
    @roof.update(shade_value: params[:shade_value].to_i)
    redirect to "/roofs/#{params[:id]}/measurements/edit"
  end

end