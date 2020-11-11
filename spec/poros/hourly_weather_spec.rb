require 'rails_helper'

RSpec.describe HourlyWeather do
  it 'has attributes' do
    VCR.use_cassette("search_forecast", allow_playback_repeats: true) do
      lat = 39.738453
      long = -104.984853
      forecast = ForecastService.find_weather(lat, long)
      hourly_weather = HourlyWeather.new(forecast[:hourly].first)
      
      expect(hourly_weather.conditions).to be_a(String)
      expect(hourly_weather.conditions).to eq("few clouds")
      expect(hourly_weather.icon).to be_a(String)
      expect(hourly_weather.icon).to eq("02d")
      expect(hourly_weather.temperature).to be_a(Float)
      expect(hourly_weather.temperature).to eq(42.62)
      expect(hourly_weather.time).to be_a(String)
      expect(hourly_weather.time).to eq("16:00:00")
      expect(hourly_weather.wind_direction).to be_a(String)
      expect(hourly_weather.wind_direction).to eq("NE")
      expect(hourly_weather.wind_speed).to be_a(Float)
      expect(hourly_weather.wind_speed).to eq(4.36)
    end
  end
  
  it 'returns cardinal directions based on provided direction in degrees' do
    VCR.use_cassette("search_forecast", allow_playback_repeats: true) do
      lat = 39.738453
      long = -104.984853
      forecast = ForecastService.find_weather(lat, long)
      hourly_weather = HourlyWeather.new(forecast[:hourly].first)
      
      expect(hourly_weather.get_cardinal_direction(11)).to eq("N")
      expect(hourly_weather.get_cardinal_direction(33)).to eq("NNE")
      expect(hourly_weather.get_cardinal_direction(56)).to eq("NE")
      expect(hourly_weather.get_cardinal_direction(78)).to eq("ENE")
      expect(hourly_weather.get_cardinal_direction(101)).to eq("E")
      expect(hourly_weather.get_cardinal_direction(123)).to eq("ESE")
      expect(hourly_weather.get_cardinal_direction(146)).to eq("SE")
      expect(hourly_weather.get_cardinal_direction(168)).to eq("SSE")
      expect(hourly_weather.get_cardinal_direction(191)).to eq("S")
      expect(hourly_weather.get_cardinal_direction(213)).to eq("SSW")
      expect(hourly_weather.get_cardinal_direction(236)).to eq("SW")
      expect(hourly_weather.get_cardinal_direction(258)).to eq("WSW")
      expect(hourly_weather.get_cardinal_direction(281)).to eq("W")
      expect(hourly_weather.get_cardinal_direction(303)).to eq("WNW")
      expect(hourly_weather.get_cardinal_direction(326)).to eq("NW")
      expect(hourly_weather.get_cardinal_direction(348)).to eq("NNW")
    end
  end
end