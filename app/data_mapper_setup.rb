env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://postgres:a@localhost/look_up_development")
DataMapper.finalize
DataMapper.auto_upgrade!

