require 'rails_helper'

RSpec.describe ForecastService do
  it 'returns coordinates based off of search' do
    VCR.use_cassette('forecast') do
      lat = 39.738453
      long = -104.984853
      results = ForecastService.find_weather(lat, long)

      expect(results[:current]).to be_a(Hash)
      expect(results[:hourly]).to be_a(Array)
      expect(results[:daily]).to be_a(Array)
    end
  end
end