class DirectionsFacade
  def self.search(location, trails_data)
    @start = CoordinatesService.get_lat_long(location)[:results][0][:locations][0][:latLng]
    
    
    finish = {:lat=>38.00, :lng=>-105.00}
    
    
    DirectionsService.get_distance(@start, finish)
    binding.pry
    # end =
    # lat_long = CoordinatesService.get_lat_long(search_params)
    # lat = parsed_lat(lat_long)
    # long = parsed_long(lat_long)
    # DirectionsService.find_trails(start, end)
  end

end