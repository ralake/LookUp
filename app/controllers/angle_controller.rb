class LookUp < Sinatra::Base

  post '/roofs/:id/type/edit' do
    @roof.params_parser(params)
    @roof.to_json
  end

end