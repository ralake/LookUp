class LookUp < Sinatra::Base

  post '/roofs/:id/measurements' do
    format_measurments(params)
    @roof.params_parser(params)
  end

end