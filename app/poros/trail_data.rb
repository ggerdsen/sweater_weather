class TrailData
  
  def initialize(location_info, forecast_info, map_info)
    @id = nil
    @type = "trail"
    @location = location_info
    @forecast = forecast_info
    @trails = map_info
  end
  
end