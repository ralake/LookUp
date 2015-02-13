require 'dm-validations'

class Roof

  include DataMapper::Resource
  
  property :id,                   Serial
  property :created_at,           DateTime
  property :shade,                String
  property :material,             String
  property :angle,                Integer # must have
  property :orientation,          Integer
  property :photo_url,            Text
  property :latitude,             Float  # must have
  property :longitude,            Float  # must have
  property :title,                String
  property :discovered_by,        String
  property :user_email,           String
  property :gutter_edge,          Float  # must have
  property :angled_edge,          Float  # must have
  property :panel_capacity,       Integer
  property :power_capacity,       Integer

  validates_format_of :user_email, :as => :email_address, message: "The email address you've entered is not valid. Please enter another"

  FLAT_ROOF_PANEL_AREA = 2.56

  SLOPED_ROOF_PANEL_AREA = 1.6

  PANEL_POWER = 250

  def set_capacities
    set_panel_capacity
    set_power_capacity
  end

  def params_parser(params)
    methods.each do |method|
      update(method => params[method.to_s]) if params.keys.include?(method.to_s)
    end
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