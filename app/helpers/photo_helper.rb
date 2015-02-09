def upload_image(name)
  establish_connection
  store_image(name)
  return "https://#{ENV['S3_BUCKET_NAME']}.s3.amazonaws.com/#{name}"
end

def establish_connection
  AWS::S3::Base.establish_connection!(
    :access_key_id    => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  )
end

def store_image(name)
  AWS::S3::S3Object.store(
    name,
    open("public/images/user_images/#{name}"),
    ENV['S3_BUCKET_NAME'],
    :access => :public_read
  )
end