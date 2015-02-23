class LookUp < Sinatra::Base

  post '/roofs/:id/measurements' do
    @roof.params_parser(params)
    @roof.set_capacities
    @roof.power_homes
    puts @roof.homes_to_power
    @roof.to_json
  end

end