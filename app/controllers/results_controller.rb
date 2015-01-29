class LookUp < Sinatra::Base

  get '/roofs/:id/capacity/edit' do
    @roof.set_capacities
    erb :result
  end

  post '/roofs/:id/capacity' do
    @roof.update(title: params[:title], discovered_by: params[:discovered_by], user_email: params[:email])
    email_validation(@roof)
  end

end