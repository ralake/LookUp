class LookUp < Sinatra::Base

  get '/summary' do
    @roof = Roof.first(id: session[:roof_id])
    erb :summary
  end

  post '/creator' do
    Roof.find_roof(session[:roof_id]).set_discovery_data(params[:title], params[:discovered_by])
    redirect to '/thankyou'
  end

end
