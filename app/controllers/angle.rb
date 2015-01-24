class LookUp < Sinatra::Base
 
  get '/roof_angle' do
    erb :roof_angle
  end

  post '/flat_roof_orientation_angle' do
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
