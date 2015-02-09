class LookUp < Sinatra::Base 

  post '/roofs/:id/shading' do
    @roof.params_parser(params)
  end

end