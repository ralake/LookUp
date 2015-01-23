class LookUp < Sinatra::Base

  get '/shading' do
    erb :shading
  end

  post '/shading_data' do
    roof = Roof.first_or_create(:id => session[:roof_id])
    roof.update(shade_value: params[:shade_value].to_i)
    redirect to '/roof_angle'
  end

end