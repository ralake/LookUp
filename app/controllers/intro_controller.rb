class LookUp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/roofs/new' do
    roof = Roof.create
    roof.params_parser(params)
    roof.to_json
  end

end