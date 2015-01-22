class LookUp < Sinatra::Base
 
  get '/roof_angle' do
    erb :roof_angle
  end

  post '/roof_type' do
    roof = Roof.first(:id => session[:roof_id])
    if params[:roof_type] == "Flat"
      roof.update(roof_angle: 0)
      redirect to '/summary'
    else
      redirect to '/sloped_roof'
    end
  end

  get '/sloped_roof' do
    erb :sloped_roof
  end

  post '/sloped_roof_angle' do
    p params
    redirect to '/summary'
  end 

end
