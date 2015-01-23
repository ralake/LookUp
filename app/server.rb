require 'sinatra'
require 'data_mapper'
require 'aws/s3'
require_relative 'models/roof'
require_relative 'data_mapper_setup'
require_relative 'controllers/angle'
require_relative 'controllers/index'
require_relative 'controllers/infopage'
require_relative 'controllers/material'
require_relative 'controllers/photo'
require_relative 'controllers/shading'
require_relative 'controllers/summary'


class LookUp < Sinatra::Base

  set :views, File.join(root, '..', 'views')
  set :public_dir, File.join(root, '../..', 'public')
  enable :sessions

  get '/gyroscope' do
    erb :gyroscope
  end

  post '/photo_capture' do
    photo_url = upload_image(params)
  end

  run! if app_file == $0
end


def upload_image (params)
  AWS::S3::Base.establish_connection!(
    :access_key_id    => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  )
  AWS::S3::S3Object.store(
    params[:file][:filename],
    open(params[:file][:tempfile].path),
    ENV['S3_BUCKET_NAME'],
    :access => :public_read
  )
  return "https://#{ENV['S3_BUCKET_NAME']}.s3.amazonaws.com/#{params[:file][:filename]}"
end
