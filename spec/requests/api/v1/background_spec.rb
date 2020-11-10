require 'rails_helper'

describe "Background Endpoint" do
  before :each do
    VCR.use_cassette("background_data", allow_playback_repeats: true, :record => :new_episodes) do
      get "/api/v1/backgrounds?location=denver,co"
      expect(response.status).to eq(200)
      expect(response).to be_successful
      @background = JSON.parse(response.body, symbolize_names: true)
    end
  end
  
  it "can return a backround image relavant to my search" do

    expect(background[:data]).to be_a(Hash)

  end
end