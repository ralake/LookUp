class Roof

  include DataMapper::Resource
  
  property :id,                   Serial
  property :created_at,           String
  property :shade_value,          Integer
  property :material,             String
  property :roof_angle,           Integer
  property :orientation,          Integer
  property :photo_url,            Text
  property :latitude,             Float
  property :longitude,            Float
  property :title,                String
  property :discovered_by,        String
  property :user_email,           String
  property :area,                 Float
  property :solar_panel_capacity, Integer
  property :solar_power_capacity, Integer

  FLAT_ROOF_PANEL_AREA = 2.56

  def self.create_roof
    # change method name
    create(created_at: "#{(Time.now).strftime('%H:%M | %d.%m.%Y')}")
  end

  def self.find_roof(id)
    # change method name
    first(id: id)
  end

  def set_photo_url(url)
    update(photo_url: url)
  end

  def set_geolocation(latitude, longitude)
    update(latitude: latitude, longitude: longitude)
  end

  def set_material(material)
    update(material: material)
  end

  def set_flat_roof_data(angle, orientation)
    update(roof_angle: angle, orientation: set_azimuth(orientation))
  end

  def set_sloped_roof_orientation(orientation)
    update(orientation: set_azimuth(orientation))
  end

  def set_sloped_roof_angle(angle)
    update(roof_angle: angle)
  end

  def destroy_record
    destroy
  end

  def set_shade_value(shade_value)
    update(shade_value: shade_value)
  end

  def set_discovery_data(title, user)
    update(title: title, discovered_by: user)
  end

  def set_user_email(email)
    update(user_email: email)
  end

  def calculate_panel_capacity
    (area / FLAT_ROOF_PANEL_AREA).to_i
  end

end