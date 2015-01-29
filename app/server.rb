require 'sinatra'
require 'data_mapper'
require 'aws/s3'
require 'rack-flash'
require 'require_all'
require 'mailgun'
require 'json'

require_relative 'models/roof'
require_relative 'data_mapper_setup'

require_rel 'helpers'

class LookUp < Sinatra::Base

  use Rack::Flash
  set :views, File.join(root, 'views')
  set :public_dir, File.join(root, '../', 'public')
  enable :sessions
  set :session_secret, 'super secret'

  before '/roofs/:id/*' do
    @roof = Roof.first(id: params[:id])
  end

  get '/' do
    erb :index
  end

  post '/roofs' do
    roof = Roof.create
    session[:roof_id] = roof.id
    redirect to "/roofs/#{roof.id}/get_started"
  end

  get '/roofs/:id/get_started' do
    erb :get_started
  end

  get '/roofs/:id/start' do
    erb :angle
  end

  post '/roofs/:id/flat' do
    roof_facing(set_azimuth(params[:flat_orientation]))
    @roof.update_flat_roof_data(0, params[:flat_orientation])
    redirect to "/roofs/#{params[:id]}/photo/edit"
  end

  post '/roofs/:id/sloped' do
    roof_facing(set_azimuth(params[:sloped_orientation]))
    @roof.update_sloped_roof_orientation(params[:sloped_orientation])
    redirect to "/roofs/#{params[:id]}/sloped/edit"
  end

  get '/roofs/:id/sloped/edit' do
    erb :sloped_roof
  end

  post '/roofs/:id/angle' do
    @roof.update(roof_angle: params[:sloped_angle].to_i)
    redirect to "/roofs/#{params[:id]}/photo/edit"
  end

  get '/roofs/:id/photo/edit' do
    erb :photo
  end

  post '/roofs/:id/photo' do
    photo_url = upload_image(params)
    @roof.update(photo_url: photo_url)
    redirect to "/roofs/#{params[:id]}/material/edit"
  end

  post '/roofs/:id/geolocation' do
    @roof.update(latitude: params[:latitude], longitude: params[:longitude])
  end

  get '/roofs/:id/material/edit' do
    erb :material
  end

  post '/roofs/:id/material' do
    @roof.update(material: params[:material])
    redirect to "/roofs/#{params[:id]}/shading/edit"
  end

  get '/roofs/:id/shading/edit' do
    erb :shading
  end

  post '/roofs/:id/shading' do
    @roof.update(shade_value: params[:shade_value].to_i)
    redirect to "/roofs/#{params[:id]}/measurements/edit"
  end

  get '/roofs/:id/measurements/edit' do
    erb :measurements
  end

  get '/roofs/:id' do
    roof.to_json
  end

  post '/roofs/:id/measurements' do
    format_measurments(params)
    @roof.update(angled_edge: params[:angled_edge], gutter_edge: params[:gutter_edge])
    redirect to "/roofs/#{params[:id]}/capacity/edit"
  end
  
  get '/roofs/:id/capacity/edit' do
    @roof.set_capacities
    erb :result
  end

  post '/roofs/:id/capacity' do
    @roof.update(title: params[:title], discovered_by: params[:discovered_by], user_email: params[:email])
    email_validation(@roof)
  end

  run! if app_file == $0

end
