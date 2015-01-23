class LookUp < Sinatra::Base

  get '/infopage' do
    roof = Roof.create(:created_at => "#{(Time.now).strftime('%H:%M | %d.%m.%Y')}")
    session[:roof_id] = roof.id
    erb :infopage
  end

end