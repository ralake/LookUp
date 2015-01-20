require 'sinatra'


class LookUp < Sinatra::Base

  # set :views, Proc.new{File.join(root, "views")}
  set :public_dir, File.join(root, '..', 'public')

  get '/infopage' do
    erb :infopage
  end

  run! if app_file == $0

end