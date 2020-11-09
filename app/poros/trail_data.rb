class TrailData
  
  attr_reader :id,
              :type,
              :location,
              :forecast,
              :trails
  
  def initialize(location_info, forecast_info, map_info)
    @id = "null"
    @type = "trail"
    @location = location_info
    @forecast = parse_forecast(forecast_info)
    @trails = map_info
  end
  
  def parse_forecast(forecast)
    parsed = Hash.new
    parsed[:summary] = forecast.conditions
    parsed[:temperature] = forecast.temperature.to_s
    parsed
  end
  
end