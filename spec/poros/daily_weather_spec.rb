require 'rails_helper'

RSpec.describe DailyWeather do
  it 'has attributes' do
    VCR.use_cassette("search_forecast", allow_playback_repeats: true) do
      lat = 39.738453
      long = -104.984853
      forecast = ForecastService.find_weather(lat, long)
      daily_weather = DailyWeather.new(forecast[:daily].first)

      expect(daily_weather.conditions).to be_a(String)
      expect(daily_weather.conditions).to eq("clear sky")
      expect(daily_weather.date).to be_a(String)
      expect(daily_weather.date).to eq("2020/11/10")
      expect(daily_weather.icon).to be_a(String)
      expect(daily_weather.icon).to eq("01d")
      expect(daily_weather.max_temp).to be_a(Float)
      expect(daily_weather.max_temp).to eq(43.75)
      expect(daily_weather.min_temp).to be_a(Float)
      expect(daily_weather.min_temp).to eq(33.13)
      expect(daily_weather.sunrise).to be_a(Time)
      expect(daily_weather.sunrise).to eq("2020-11-10 06:39:30 -0700")
      expect(daily_weather.sunset).to be_a(Time)
      expect(daily_weather.sunset).to eq("2020-11-10 16:48:25 -0700")
    end
  end
end