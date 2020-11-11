require 'rails_helper'

RSpec.describe CurrentWeather do
  it 'has attributes' do
    VCR.use_cassette("search_forecast", allow_playback_repeats: true) do
      forecast = SearchFacade.search_forecast('denver,co')
      expect(forecast.current_weather).to be_a(CurrentWeather)
      expect(forecast.current_weather.conditions).to be_a(String)
      expect(forecast.current_weather.conditions).to eq("few clouds")
      expect(forecast.current_weather.feels_like).to be_a(Float)
      expect(forecast.current_weather.feels_like).to eq(29.53)
      expect(forecast.current_weather.humidity).to be_a(Integer)
      expect(forecast.current_weather.humidity).to eq(35)
      expect(forecast.current_weather.icon).to be_a(String)
      expect(forecast.current_weather.icon).to eq("02d")
      expect(forecast.current_weather.temperature).to be_a(Float)
      expect(forecast.current_weather.temperature).to eq(42.62)
      expect(forecast.current_weather.uvi).to be_a(Float)
      expect(forecast.current_weather.uvi).to eq(2.41)
      expect(forecast.current_weather.visibility).to be_a(Integer)
      expect(forecast.current_weather.visibility).to eq(10000)
    end
  end
end