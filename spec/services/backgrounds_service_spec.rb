require 'rails_helper'

RSpec.describe BackgroundsService do
  it 'returns image based on search' do
    VCR.use_cassette('backgrounds') do
      results = BackgroundsService.get_background('denver,co')
      expect(results).to be_a(Hash)
      expect(results[:results].first).to be_a(Hash)
      expect(results[:results].first[:id]).to eq("36XAdOONlxc")
      expect(results[:results].first[:urls][:raw]).to be_a(String)
      expect(results[:results].first[:urls][:raw]).to eq("https://images.unsplash.com/photo-1578983427937-26078ee3d9d3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE4MTYwMH0")
      expect(results[:results].first[:user][:username]).to be_a(String)
      expect(results[:results].first[:user][:username]).to eq("joshua_forbes")
    end
  end
end