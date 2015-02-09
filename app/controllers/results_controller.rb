class LookUp < Sinatra::Base

  post '/roofs/:id/capacity' do
    @roof.params_parser(params)
    email_validation(@roof)
  end

end
