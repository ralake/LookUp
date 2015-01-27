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
require_rel 'controllers'

class RoofController < Sinatra::Base

  use Rack::Flash
  set :views, File.join(root, 'views')
  set :public_dir, File.join(root, '../', 'public')
  enable :sessions
  set :session_secret, 'super secret'

  get '/roofs' do
    erb :index
  end

  post '/roofs/new' do
    roof = Roof.create(created_at: "#{(Time.now).strftime('%H:%M | %d.%m.%Y')}")
    session[:roof_id] = roof.id
    redirect to "/roofs/#{roof.id}/information"
  end

  get '/roofs/:id/information' do
    @roof = Roof.first(id: params[:id])
    erb :information
  end

  get '/roofs/:id/angle/edit' do
    @roof = Roof.first(id: params[:id])
    erb :angle
  end

  post '/roofs/:id/flat_roof_data' do
    roof_facing(set_azimuth(params[:flat_orientation]))
    Roof.first(id: params[:id]).update_flat_roof_data(0, params[:flat_orientation])
    redirect to "/roofs/#{params[:id]}/photo/edit"
  end

  post '/roofs/:id/sloped_roof_orientation' do
    roof_facing(set_azimuth(params[:sloped_orientation]))
    Roof.first(id: session[:roof_id]).update_sloped_roof_orientation(params[:sloped_orientation])
    redirect to "/roofs/#{params[:id]}/sloped_roof/edit"
  end

  get '/roofs/:id/sloped_roof/edit' do
    @roof = Roof.first(id: params[:id])
    erb :sloped_roof
  end

  post '/roofs/:id/sloped_roof_angle' do
    Roof.first(id: params[:id]).update(roof_angle: params[:sloped_angle].to_i)
    redirect to "/roofs/#{params[:id]}/photo/edit"
  end

  get '/roofs/:id/photo/edit' do
    @roof = Roof.first(id: params[:id])
    erb :photo
  end

  post '/roofs/:id/photo' do
    photo_url = upload_image(params)
    Roof.first(id: params[:id]).update(photo_url: photo_url)
    redirect to "/roofs/#{params[:id]}/material/edit"
  end

  post '/roofs/geolocation' do
    Roof.first(id: session[:roof_id]).update(latitude: params[:latitude], longitude: params[:longitude])
  end

  run! if app_file == $0

end
