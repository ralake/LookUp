def reverse_bearing(params)
  if params[:orientation].to_i < 180
    params[:orientation] = params[:orientation].to_i + 180
  else
    params[:orientation] = params[:orientation].to_i - 180
  end
end
 

def roof_direction(bearing)
  if [*(271...360), *(0...90)].include?(bearing.to_i)
    flash[:notice] = "Sorry this roof is facing north.\n Please find a south facing roof." 
    @roof.destroy
    redirect to '/'
  end
end


