def roof_direction(bearing)
  if [*(271...360), *(0...90)].include?(bearing.to_i)
    flash[:notice] = "Sorry this roof is facing north.\n Please find a south facing roof." 
    @roof.destroy
    redirect to '/'
  end
end


