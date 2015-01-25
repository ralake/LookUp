class LookUp < Sinatra::Base

  get '/shading' do
    erb :shading
  end

  post '/shading_data' do
    Roof.add_shade_value(session, params)
    redirect to '/roof_angle'
  end

end