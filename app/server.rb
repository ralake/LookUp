require 'sinatra'
require 'data_mapper'
require_relative 'models/roof'
require_relative 'data_mapper_setup' 

class LookUp < Sinatra::Base

  set :public_dir, File.join(root, '..', 'public')
  enable :sessions

  get '/' do
    erb :index 
  end

  get '/infopage' do
    erb :infopage
  end

  get '/photo' do
    erb :photo
  end

  get '/material' do
    erb :material
  end

  post '/material_data' do
    roof = Roof.create(material: params[:material])
    session[:roof_id] = roof.id
    redirect to '/shading'
  end

  get '/shading' do
    erb :shading
  end

  post '/shading_data' do
    roof = Roof.first(:id => session[:roof_id])
    roof.update(shade_value: params[:shade_value].to_i)
    redirect to '/roof_angle'
  end

  get '/roof_angle' do
    erb :roof_angle
  end

  post '/roof_type' do
    roof = Roof.first(:id => session[:roof_id])
    if params[:roof_type] == "Flat"
      roof.update(roof_angle: 90)
      redirect to '/summary'
    else
      redirect to '/sloped_roof'
    end
  end

  get '/sloped_roof' do
    erb :sloped_roof
  end

  post '/sloped_roof_angle' do
    redirect to '/summary'
  end 

  get '/summary' do
    erb :summary
  end


  run! if app_file == $0

end
