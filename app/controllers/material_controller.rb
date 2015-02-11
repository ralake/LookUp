class LookUp < Sinatra::Base

  post '/roofs/:id/material' do
    p params
    @roof.params_parser(params)
    @roof.to_json
  end

end