class Roof

  include DataMapper::Resource
  
  property :id,            Serial
  property :created_at,    String
  property :shade_value,   Integer
  property :material,      String
  property :roof_angle,    Integer
  property :orientation,   Integer
  property :photo_url,     Text
  property :latitude,      Float
  property :longitude,     Float
  property :title,         String
  property :discovered_by, String
  property :user_email,    String

end
