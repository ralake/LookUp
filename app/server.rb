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

  get '/' do
    erb :index
  end

  post '/roofs' do
    roof = Roof.create(created_at: "#{(Time.now).strftime('%H:%M | %d.%m.%Y')}")
    session[:roof_id] = roof.id
    redirect to "/roofs/#{roof.id}/get_started"
  end

  get '/roofs/:id/get_started' do
    @roof = Roof.first(id: params[:id])
    erb :get_started
  end

  get '/roofs/:id/start' do
    @roof = Roof.first(id: params[:id])
    erb :angle
  end

  post '/roofs/:id/flat' do
    roof_facing(set_azimuth(params[:flat_orientation]))
    Roof.first(id: params[:id]).update_flat_roof_data(0, params[:flat_orientation])
    redirect to "/roofs/#{params[:id]}/photo/edit"
  end

  post '/roofs/:id/sloped' do
    roof_facing(set_azimuth(params[:sloped_orientation]))
    Roof.first(id: params[:id]).update_sloped_roof_orientation(params[:sloped_orientation])
    redirect to "/roofs/#{params[:id]}/sloped/edit"
  end

  get '/roofs/:id/sloped/edit' do
    @roof = Roof.first(id: params[:id])
    erb :sloped_roof
  end

  post '/roofs/:id/angle' do
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

  post '/geolocation' do
    p params
    Roof.first(id: session[:roof_id]).update(latitude: params[:latitude], longitude: params[:longitude])
  end

  get '/roofs/:id/material/edit' do
    @roof = Roof.first(id: params[:id])
    erb :material
  end

  post '/roofs/:id/material' do
    Roof.first(id: params[:id]).update(material: params[:material])
    redirect to "/roofs/#{params[:id]}/shading/edit"
  end

  get '/roofs/:id/shading/edit' do
    @roof = Roof.first(id: params[:id])
    erb :shading
  end

  post '/roofs/:id/shading' do
    Roof.first(id: params[:id]).update(shade_value: params[:shade_value].to_i)
    redirect to "/roofs/#{params[:id]}/summary/edit"
  end

  get '/roofs/:id/summary/edit' do
    @roof = Roof.first(id: params[:id])
    erb :summary
  end

  post '/roofs/:id/summary' do
    Roof.first(id: params[:id]).update(title: params[:title], discovered_by: params[:discovered_by])
    redirect to "/roofs/#{params[:id]}/email/edit"
  end

  get '/roofs/:id/email/edit' do
    @roof = Roof.first(id: params[:id])
    erb :email
  end

  post '/roofs/:id/email' do
    roof = Roof.first(id: params[:id])
    roof.update(user_email: params[:email])
    send_email_with_link(roof)
    redirect to 'http://www.1010global.org/uk'
  end

  get '/roofs/:id/area/edit' do
    @roof = Roof.first(id: params[:id])
    erb :area
  end

  get '/roofs/:id' do
    roof = Roof.first(id: params[:id])
    roof.to_json
  end

  post '/roofs/:id/area' do
    Roof.first(id: params[:id]).update(angled_edge: params[:angled_edge], gutter_edge: params[:gutter_edge])
    redirect to "/roofs/#{params[:id]}/capacity"
  end

  get '/roofs/:id/capacity' do
    @roof = Roof.first(id: params[:id])
    @roof.set_capacities
    erb :result
  end

  run! if app_file == $0

end
