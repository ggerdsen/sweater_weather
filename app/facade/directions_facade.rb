class DirectionsFacade
  
  def self.search(location, trails_data, current_weather)
    @forecast = current_weather
    @start = CoordinatesService.get_lat_long(location)[:results][0][:locations][0][:latLng]
    
    #adds distance to trail to each trail 
    trails_data[:trails].each do |trail|
      finish = parsed_lat_long(trail)
      trail[:distance] = DirectionsService.get_distance(@start, finish)
    end
    # end =
    # lat_long = CoordinatesService.get_lat_long(location)
    # lat = parsed_lat(lat_long)
    # long = parsed_long(lat_long)
    # DirectionsService.get_distance(start, end)
  end
  
  #creates lat/long hash in same format as CoordinatesService lat/long
  def self.parsed_lat_long(trail)
    lat_long = Hash.new
    lat_long[:lat] = trail[:latitude]
    lat_long[:lng] = trail[:longitude]
    lat_long
  end

end