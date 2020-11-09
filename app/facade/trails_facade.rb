class TrailsFacade
  def self.search(search_params)
    @location = search_params
    lat_long = CoordinatesService.get_lat_long(search_params)
    lat = parsed_lat(lat_long)
    long = parsed_long(lat_long)
    TrailsService.find_trails(lat, long)
  end
  
  def self.parsed_lat(lat_long)
    lat_long[:results].first[:locations].first[:latLng][:lat]
  end
  
  def self.parsed_long(lat_long)
    lat_long[:results].first[:locations].first[:latLng][:lng]
  end
end