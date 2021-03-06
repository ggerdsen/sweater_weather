require 'rails_helper'

RSpec.describe SearchFacade do
  
  it "returns a forecast" do
    VCR.use_cassette("search_forecast", allow_playback_repeats: true) do
      location = SearchFacade.search_forecast("denver,co")
      expect(location.current_weather).to be_a(CurrentWeather)
      expect(location.current_weather.conditions).to be_a(String)
      expect(location.current_weather.conditions).to eq("few clouds")
      expect(location.current_weather.feels_like).to be_a(Float)
      expect(location.current_weather.feels_like).to eq(29.53)
      expect(location.current_weather.humidity).to be_a(Integer)
      expect(location.current_weather.humidity).to eq(35)
      expect(location.current_weather.icon).to be_a(String)
      expect(location.current_weather.icon).to eq("02d")
      expect(location.current_weather.temperature).to be_a(Float)
      expect(location.current_weather.temperature).to eq(42.62)
      expect(location.current_weather.uvi).to be_a(Float)
      expect(location.current_weather.uvi).to eq(2.41)
      expect(location.current_weather.visibility).to be_a(Integer)
      expect(location.current_weather.visibility).to eq(10000)
      
      lat_long = CoordinatesService.get_lat_long("denver,co")
      
      expect(SearchFacade.parsed_lat(lat_long)).to be_a(Float)
      expect(SearchFacade.parsed_lat(lat_long)).to eq(39.738453)
      expect(SearchFacade.parsed_long(lat_long)).to be_a(Float)
      expect(SearchFacade.parsed_long(lat_long)).to eq(-104.984853)
    end
  end
  
  it "returns a background" do
    VCR.use_cassette("search_backgrounds", allow_playback_repeats: true) do
      background = SearchFacade.search_backgrounds("denver,co")
      expect(background).to be_a(BackgroundData)
      expect(background.id).to be_a(String)
      expect(background.id).to eq("null")
      expect(background.type).to be_a(String)
      expect(background.type).to eq("image")
      expect(background.image).to be_a(ImageData)
    end
  end
end