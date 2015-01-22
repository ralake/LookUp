require 'sinatra'
require 'data_mapper'
require_relative 'models/roof'
require_relative 'data_mapper_setup' 

class LookUp < Sinatra::Base

  set :public_dir, File.join(root, '..', 'public')
  enable :sessions

  get '/' do
    # erb :index, layout: :layout_index
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

  run! if app_file == $0

end
