class LookUp < Sinatra::Base

  get '/roof_angle' do
    erb :roof_angle
  end

  post '/flat_roof_orientation_angle' do
    roof_facing(set_azimuth(params[:flat_orientation]))
    Roof.add_flat_roof_data(session, params)
    redirect to '/summary'
  end

  get '/sloped_roof' do
    erb :sloped_roof
  end

  post '/sloped_roof_orientation' do
    roof_facing(set_azimuth(params[:sloped_orientation]))
    Roof.add_sloped_roof_orientation(session, params)
    redirect to '/sloped_roof'
  end

  post '/sloped_roof_angle' do
    Roof.add_sloped_roof_angle(session, params)
    redirect to '/summary'
  end

end
