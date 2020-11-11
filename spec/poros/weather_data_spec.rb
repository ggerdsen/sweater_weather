require 'rails_helper'

RSpec.describe WeatherData do
  it 'has attributes' do
    VCR.use_cassette("search_forecast", allow_playback_repeats: true) do
      lat = 39.738453
      long = -104.984853
      forecast = ForecastService.find_weather(lat, long)
      weather_data = WeatherData.new(forecast)
      
      expect(weather_data.id).to eq(nil)
      expect(weather_data.type).to eq("forecast")
      expect(weather_data.current_weather).to be_a(CurrentWeather)
      expect(weather_data.hourly_weather.first).to be_a(HourlyWeather)
      expect(weather_data.daily_weather.first).to be_a(DailyWeather)
    end
  end
end