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

  def self.create_roof(session)
    roof = self.create(created_at: "#{(Time.now).strftime('%H:%M | %d.%m.%Y')}")
    session[:roof_id] = roof.id
  end

  def self.add_photo_url(session)
    first(id: session[:roof_id]).update(photo_url: photo_url)
  end

  def self.add_geolocation(session, params)
    first(id: session[:roof_id]).update(latitude: params[:latitude], longitude: params[:longitude])
  end

  def self.add_material(session, params)
    first(id: session[:roof_id]).update(material: params[:material])
  end

  def self.add_flat_roof_data(session, params)
    first(id: session[:roof_id]).update(roof_angle: 0, orientation: set_azimuth(params[:flat_orientation]))
  end

  def self.add_sloped_roof_orientation(session, params)
    first(id: session[:roof_id]).update(orientation: set_azimuth(params[:sloped_orientation]))
  end

  def self.add_sloped_roof_angle(session, params)
    first(id: session[:roof_id]).update(roof_angle: params[:sloped_angle].to_i)
  end

  def self.destroy_record(session)
    first(id: session[:roof_id]).destroy
  end

  def self.add_shade_value(session, params)
    first(id: session[:roof_id]).update(shade_value: params[:shade_value].to_i)
  end

  def self.add_discovery_data(session, params)
    first(id: session[:roof_id]).update(title: params[:title], discovered_by: params[:discovered_by])
  end

  def self.add_user_email(session, params)
    first(id: session[:roof_id]).update(user_email: params[:email])
  end

end