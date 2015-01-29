class LookUp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/roofs' do
    roof = Roof.create
    redirect to "/roofs/#{roof.id}/get_started"
  end

  get '/roofs/:id/get_started' do
    erb :get_started
  end

end