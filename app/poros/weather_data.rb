class WeatherData
  attr_reader :id,
              :type,
              :current_weather
  
  def initialize(data)
    @id = nil
    @type = "forecast"
    @current_weather = CurrentWeather.new(data[:current])
    @daily_weather = DailyWeather.new(data[:daily])
    @hourly_weather = HourlyWeather.new(data[:hourly])
  end
end