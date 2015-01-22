class LookUp < Sinatra::Base
 
  get '/summary' do
    erb :summary
  end

end