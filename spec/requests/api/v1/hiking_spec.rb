require 'rails_helper'

describe "Hiking" do
  before :each do
    VCR.use_cassette("hiking_data", allow_playback_repeats: true, :record => :new_episodes) do
      get "/api/v1/trails?location=denver,co"
      expect(response.status).to eq(200)
      expect(response).to be_successful
      @response = JSON.parse(response.body, symbolize_names: true)
      
    end
  end
  
  it "Hiking Data JSON Response" do
    
    expect(@response[:data][:type]).to eq ("trail")
    expect(@response[:data]).to have_key(:attributes)
    expect(@response[:data][:attributes]).to have_key(:location)
    expect(@response[:data][:attributes]).to have_key(:forecast)
    expect(@response[:data][:attributes]).to have_key(:trails)
    
  end
end