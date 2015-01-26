class LookUp < Sinatra::Base

  get '/desktop' do
    @roof = Roof.find_roof(params[:id])
    erb :desktop
  end

end
