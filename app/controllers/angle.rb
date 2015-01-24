class LookUp < Sinatra::Base
 
  get '/roof_angle' do
    erb :roof_angle
  end

  post '/flat_roof_orientation_angle' do
    compass, orient = params[:flat_orientation].to_i, 0
    compass > 180 ? orient = compass-180 : orient = compass+180
    if [*(271...360), *(0...90)].include?(orient)
      flash[:notice] = "Sorry you roof facing north" 
      redirect to '/'
    end
    roof = Roof.first(:id => session[:roof_id])
    roof.update(roof_angle: 0)
    roof.update(orientation: params[:flat_orientation])
    redirect to '/summary'
  end

  get '/sloped_roof' do
    erb :sloped_roof
  end

  post '/sloped_roof_orientation' do
    roof = Roof.first(:id => session[:roof_id])
    roof.update(orientation: params[:sloped_orientation])
    redirect to '/sloped_roof'
  end

  post '/sloped_roof_angle' do
    roof = Roof.first(:id => session[:roof_id])
    roof.update(roof_angle: params[:sloped_angle].to_i)
    redirect to '/summary'
  end 

end
