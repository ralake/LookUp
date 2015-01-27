require 'sinatra'


class LookUp < Sinatra::Base

  # set :views, Proc.new{File.join(root, "views")}
  set :public_dir, File.join(root, '..', 'public')

  get '/gyroscope' do
    erb :gyroscope
  end

  get '/compass' do
    erb :compass
  end

  run! if app_file == $0

end