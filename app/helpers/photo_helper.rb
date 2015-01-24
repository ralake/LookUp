def upload_image(params)
  establish_connection
  store_image(params)
  return "https://#{ENV['S3_BUCKET_NAME']}.s3.amazonaws.com/#{params[:file][:filename]}"
end

def establish_connection
  AWS::S3::Base.establish_connection!(
    :access_key_id    => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  )
end

def store_image(params)
  AWS::S3::S3Object.store(
    params[:file][:filename],
    open(params[:file][:tempfile].path),
    ENV['S3_BUCKET_NAME'],
    :access => :public_read
  )
end