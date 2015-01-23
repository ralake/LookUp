class Roof

  include DataMapper::Resource
  
  property :id,          Serial
  property :created_at,  String
  property :shade_value, Integer
  property :material,    String
  property :roof_angle,  Integer
  property :photo_url,   Text

end
