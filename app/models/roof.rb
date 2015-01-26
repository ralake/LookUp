class Roof

  include DataMapper::Resource
  
  property :id,            Serial
  property :created_at,    String
  property :shade_value,   Integer
  property :material,      String
  property :roof_angle,    Integer
  property :orientation,   Integer
  property :photo_url,     Text
  property :geolocation,   String
  property :title,         String
  property :discovered_by, String
  property :user_email,    String

  def self.create_roof
    create(created_at: "#{(Time.now).strftime('%H:%M | %d.%m.%Y')}")
  end

  def self.find_roof(id)
    first(id: id)
  end

  def add_photo_url(url)
    update(photo_url: url)
  end

  def add_geolocation(latitude, longitude)
    geolocation = latitude.to_s + ',' + longitude.to_s
    update(geolocation: geolocation)
  end

  def add_material(material)
    update(material: material)
  end

  def add_flat_roof_data(angle, orientation)
    update(roof_angle: angle, orientation: set_azimuth(orientation))
  end

  def add_sloped_roof_orientation(orientation)
    update(orientation: set_azimuth(orientation))
  end

  def add_sloped_roof_angle(angle)
    update(roof_angle: angle)
  end

  def destroy_record
    destroy
  end

  def add_shade_value(shade_value)
    update(shade_value: shade_value)
  end

  def add_discovery_data(title, user)
    update(title: title, discovered_by: user)
  end

  def add_user_email(email)
    update(user_email: email)
  end

end