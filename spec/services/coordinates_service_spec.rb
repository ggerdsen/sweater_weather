require 'rails_helper'

RSpec.describe CoordinatesService do
  it 'returns coordinates based off of search' do
    VCR.use_cassette('coordinates') do
      results = CoordinatesService.get_lat_long('denver,co')
      
      expect(results).to be_a(Hash)
      expect(results[:results].first[:locations].first[:latLng]).to be_a(Hash)
      expect(results[:results].first[:locations].first[:latLng]).to eq({:lat=>39.738453, :lng=>-104.984853})
    end
  end
end