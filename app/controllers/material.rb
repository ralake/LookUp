class LookUp < Sinatra::Base

  get '/material' do
    erb :material
  end

  post '/material_data' do
    Roof.add_material(session, params)
    redirect to '/shading'
  end

end
