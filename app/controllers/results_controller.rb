class LookUp < Sinatra::Base

  get '/roofs/:id/capacity/edit' do
    @roof.set_capacities
    erb :result
  end

  post '/roofs/:id/capacity' do
    @roof.params_parser(params)
    email_validation(@roof)
  end

end
