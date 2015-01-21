class Roof
  
  include DataMapper::Resource

  property :id,          Serial
  property :shade_value, Integer


end