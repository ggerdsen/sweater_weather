class SearchFacade
  def self.search_forecast(search_params)
    @location = search_params
    lat_long = CoordinatesService.get_lat_long(search_params)
    lat = parsed_lat(lat_long)
    long = parsed_long(lat_long)
    weather_data(ForecastService.find_weather(lat, long))
  end
  
  def self.search_backgrounds(search_params)
    backgrounds = BackgroundsService.get_background(search_params)
    BackgroundData.new(backgrounds, search_params)
  end
  
  def self.get_info(user, start_city, end_city)
    travel_time = DirectionsService.get_directions(start_city, end_city)
    destination_info = CoordinatesService.get_lat_long(end_city)
    destination_weather = ForecastService.find_weather(parsed_lat(destination_info), parsed_long(destination_info))
    RoadTrip.new(start_city, destination_info, travel_time, destination_weather)
  end
  
  def self.parsed_lat(lat_long)
    lat_long[:results].first[:locations].first[:latLng][:lat]
  end
  
  def self.parsed_long(lat_long)
    lat_long[:results].first[:locations].first[:latLng][:lng]
  end
  
  def self.weather_data(data)
    WeatherData.new(data)
  end
end