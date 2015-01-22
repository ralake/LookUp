require 'sinatra'
require 'data_mapper'
require_relative 'models/roof'
require_relative 'data_mapper_setup' 

require_relative 'controllers/angle' 
require_relative 'controllers/index' 
require_relative 'controllers/infopage' 
require_relative 'controllers/material' 
require_relative 'controllers/photo' 
require_relative 'controllers/shading' 
require_relative 'controllers/summary' 



class LookUp < Sinatra::Base

  set :views, File.join(root, '..', 'views')
  set :public_dir, File.join(root, '..', 'public')
  enable :sessions

  run! if app_file == $0

end
