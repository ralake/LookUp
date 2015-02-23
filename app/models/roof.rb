require 'dm-validations'

class Roof

  include DataMapper::Resource
  
  property :angle,                Integer
  property :angled_edge,          Float
  property :created_at,           DateTime
  property :discovered_by,        String
  property :gutter_edge,          Float
  property :homes_to_power,       Integer
  property :id,                   Serial
  property :latitude,             Float
  property :longitude,            Float
  property :material,             String
  property :orientation,          Integer
  property :panel_capacity,       Integer
  property :photo_url,            Text
  property :power_capacity,       Float
  property :shade,                String
  property :title,                String
  property :user_email,           String
  
  validates_format_of :user_email, :as => :email_address, message: "The email address you've entered is not valid. Please enter another"

  FLAT_ROOF_PANEL_AREA = 2.56

  SLOPED_ROOF_PANEL_AREA = 1.6

  PANEL_POWER = 0.250

  AVERAGE_HOME_USE = 2

  def set_capacities
    set_panel_capacity
    set_power_capacity
  end

  def params_parser(params)
    methods.each do |method|
      update(method => params[method.to_s]) if params.keys.include?(method.to_s)
    end
  end

  def power_homes
    homes = (power_capacity / AVERAGE_HOME_USE).to_i
    update(homes_to_power: homes)
  end

  private

  def set_panel_capacity
    return update(panel_capacity: flat_roof_panel_capacity) if angle == 0
    update(panel_capacity: sloped_roof_panel_capacity)
  end

  def set_power_capacity
    update(power_capacity: panel_capacity * PANEL_POWER )
  end

  def flat_roof_panel_capacity
    (gutter_edge * angled_edge / FLAT_ROOF_PANEL_AREA).to_i
  end

  def sloped_roof_panel_capacity
    sloped_roof_area / SLOPED_ROOF_PANEL_AREA
  end

  def angle_cos
    Math.cos(angle * Math::PI / 180)
  end

  def sloped_roof_area
    (angled_edge / angle_cos).to_i * gutter_edge
  end

end
