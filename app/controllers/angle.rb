class LookUp < Sinatra::Base
 
  get '/roof_angle' do
    erb :roof_angle
  end

  post '/flat_roof_orientation_angle' do
    p params
    # roof = Roof.first(:id => session[:roof_id])
    # roof.update(roof_angle: 0, roof_orientation: params[:roof_orientation])
  end

  get '/sloped_roof' do
    erb :sloped_roof
  end

  post '/sloped_roof_orientation' do
    p params
    # roof = Roof.first(:id => session[:roof_id])
    # roof.update(roof_orientation: params[:roof_orientation])
  end

  post '/sloped_roof_angle' do
    roof = Roof.first(:id => session[:roof_id])
    roof.update(roof_angle: params[:roof_angle].to_i)
  end 

end
