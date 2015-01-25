class LookUp < Sinatra::Base

  get '/summary' do
    @roof = Roof.first(id: session[:roof_id])
    erb :summary
  end

  post '/creator' do
    p params
    Roof.first(id: session[:roof_id]).update(title: params[:title], discovered_by: params[:discovered_by])
    redirect to '/thankyou'
  end

end
