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
    @trails = parse_trails(map_info)
  end
  
  def parse_forecast(forecast)
    parsed = Hash.new
    parsed[:summary] = forecast.conditions
    binding.pry
    parsed[:temperature] = forecast.temperature.round(0).to_s
    parsed
  end
  
  def parse_trails(trails)
    parsed = Hash.new
    parsed_array = []
    trails.each do |trail|
      parsed[:name] = trail[:name]
      parsed[:summary] = trail[:summary]
      parsed[:difficulty] = trail[:difficulty]
      parsed[:location] = trail[:location]
      parsed[:distance_to_trail] = trail[:distance_to_trail].to_s
      parsed_array << parsed
    end
    parsed_array
  end
  
end