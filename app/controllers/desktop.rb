class LookUp < Sinatra::Base

  get '/desktop/:id' do
    @roof = Roof.find_roof(params[:id])
    erb :desktop
  end

end
