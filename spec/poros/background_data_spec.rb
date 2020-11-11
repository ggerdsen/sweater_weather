require 'rails_helper'

RSpec.describe BackgroundData do
  it 'has attributes' do
    VCR.use_cassette("background", allow_playback_repeats: true) do
      background = SearchFacade.search_backgrounds('denver,co')
      
      expect(background).to be_a(BackgroundData)
      expect(background.id).to be_a(String)
      expect(background.id).to eq("null")
      expect(background.image).to be_a(ImageData)
      expect(background.type).to eq("image")
    end
  end
end