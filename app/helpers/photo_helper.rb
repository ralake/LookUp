def decode_image(incoming_file)
  data = incoming_file[:data]
  filename = incoming_file[:filename]
  data_index = data.index('base64') + 7
  filedata = data.slice(data_index, data.length)
  decoded_image = Base64.decode64(filedata)
end

def write_image_to_file(image, filename)
  file = File.new("./tmp/#{filename}", "w+")
  file.write(image)
  file
end

def process_image(incoming_file)
  image = decode_image(incoming_file)
  file = write_image_to_file(image, incoming_file[:filename])
end

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
    open("./tmp/#{name}"),
    ENV['S3_BUCKET_NAME'],
    :access => :public_read
  )
end