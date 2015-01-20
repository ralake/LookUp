require 'sinatra'


class LookUp < Sinatra::Base


  get '/' do
    erb :index
  end

end