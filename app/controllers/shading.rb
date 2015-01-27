class LookUp < Sinatra::Base

  get '/shading' do
    erb :shading
  end

  post '/shading_data' do
    Roof.first(id: session[:roof_id]).update(shade_value: params[:shade_value].to_i)
    redirect to '/summary'
  end

end