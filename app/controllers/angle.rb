class LookUp < Sinatra::Base

  get '/roof_angle' do
    erb :roof_angle
  end

  post '/flat_roof_orientation_angle' do
    roof_facing(set_azimuth(params[:flat_orientation]))
    Roof.find_roof(session[:roof_id]).add_flat_roof_data(0, params[:flat_orientation])
    redirect to '/summary'
  end

  get '/sloped_roof' do
    erb :sloped_roof
  end

  post '/sloped_roof_orientation' do
    roof_facing(set_azimuth(params[:sloped_orientation]))
    Roof.find_roof(session[:roof_id]).add_sloped_roof_orientation(params[:sloped_orientation])
    redirect to '/sloped_roof'
  end

  post '/sloped_roof_angle' do
    Roof.find_roof(session[:roof_id]).add_sloped_roof_angle(params[:sloped_angle].to_i)
    redirect to '/summary'
  end

end
