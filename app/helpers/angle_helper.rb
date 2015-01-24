def set_azimuth(params)
    compass = params.to_i
    return compass-180 if compass > 180
    return compass+180 if compass < 180
  end
 

def roof_facing(azimuth)
  if [*(271...360), *(0...90)].include?(azimuth)
    flash[:notice] = "Sorry you roof facing north" 
    redirect to '/'
  end
end
