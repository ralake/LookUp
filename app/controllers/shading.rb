class LookUp < Sinatra::Base

  get '/shading' do
    erb :shading
  end

  post '/shading_data' do
    Roof.find_roof(session[:roof_id]).add_shade_value(params[:shade_value].to_i)
    redirect to '/roof_angle'
  end

end