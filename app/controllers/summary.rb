class LookUp < Sinatra::Base

  get '/summary' do
    @roof = Roof.first(id: session[:roof_id])
    erb :summary
  end

  post '/creator' do
    Roof.add_discovery_data(session, params)
    redirect to '/thankyou'
  end

end
