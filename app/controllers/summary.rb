class LookUp < Sinatra::Base

  get '/summary' do
    @roof = Roof.first(id: session[:roof_id])
    erb :summary
  end

  post '/creator' do
    p params
    redirect to '/thankyou'
  end

end
