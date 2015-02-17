class LookUp < Sinatra::Base

  post '/roofs/:id/orientation' do
    @roof.params_parser(params)
    @roof.to_json
  end

end