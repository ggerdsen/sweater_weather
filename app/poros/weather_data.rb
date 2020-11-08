class WeatherData
  attr_reader :id,
              :type,
              :current_weather,
              :daily_weather,
              :hourly_weather
  
  def initialize(data)
    @id = nil
    @type = "forecast"
    @current_weather = CurrentWeather.new(data[:current])
    @daily_weather = DailyWeather.new_day(data[:daily])
    @hourly_weather = HourlyWeather.new_hour(data[:hourly])
  end
end