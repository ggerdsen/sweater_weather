require 'rails_helper'

RSpec.describe ImageData do
  it 'has attributes' do
    VCR.use_cassette("search_backgrounds", allow_playback_repeats: true) do
      search = BackgroundsService.get_background("denver,co")
      background_data = BackgroundData.new(search, "denver,co")
      image_data = ImageData.new(search[:results].first[:urls][:raw], "denver,co", "garrett")
      
      expect(image_data.credit).to be_a(Hash)
      expect(image_data.credit[:source]).to eq("unsplash.com")
      expect(image_data.credit[:author]).to eq("garrett")
      expect(image_data.credit[:logo]).to eq("https://unsplash-assets.imgix.net/marketing/press-logotype.svg?auto=format&fit=crop&q=60")
      expect(image_data.image_url).to eq("https://images.unsplash.com/photo-1578983427937-26078ee3d9d3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE4MTYwMH0")
      expect(image_data.location).to eq("denver,co")
    end
  end
end