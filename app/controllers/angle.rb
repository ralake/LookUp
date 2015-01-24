class LookUp < Sinatra::Base

  def set_azimuth(params)
    compass = params.to_i
    return compass-180 if compass > 180
    return compass+180 if compass < 180
  end
 

  def roof_facing(azimuth)
    if [*(271...360), *(0...90)].include?(azimuth)
      flash[:notice] = "Sorry you roof facing north" 
      redirect to '/'
    end
  end

  get '/roof_angle' do
    erb :roof_angle
  end

  post '/flat_roof_orientation_angle' do
    roof_facing(set_azimuth(params[:flat_orientation]))
    roof = Roof.first(:id => session[:roof_id])
    roof.update(roof_angle: 0, orientation: set_azimuth(params[:flat_orientation]))
    redirect to '/summary'
  end

  get '/sloped_roof' do
    erb :sloped_roof
  end

  post '/sloped_roof_orientation' do
    roof_facing(set_azimuth(params[:sloped_orientation]))
    roof = Roof.first(:id => session[:roof_id])
    roof.update(orientation: set_azimuth(params[:sloped_orientation]))
    redirect to '/sloped_roof'
  end

  post '/sloped_roof_angle' do
    roof = Roof.first(:id => session[:roof_id])
    roof.update(roof_angle: params[:sloped_angle].to_i)
    redirect to '/summary'
  end 

end
