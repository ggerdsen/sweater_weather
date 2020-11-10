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

    expect(@background[:data]).to be_a(Hash)
    expect(@background[:data][:id]).to eq("null")
    expect(@background[:data][:type]).to eq("image")
    expect(@background[:data][:attributes]).to be_a(Hash)
    expect(@background[:data][:attributes][:image][:location]).to eq("denver,co")
    expect(@background[:data][:attributes][:image][:image_url]).to eq("https://images.unsplash.com/photo-1578983427937-26078ee3d9d3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE4MTYwMH0")
    expect(@background[:data][:attributes][:image][:credit]).to be_a(Hash)
    expect(@background[:data][:attributes][:image][:credit][:source]).to be_a(String)
    expect(@background[:data][:attributes][:image][:credit][:source]).to eq("unsplash.com")
    expect(@background[:data][:attributes][:image][:credit][:author]).to be_a(String)
    expect(@background[:data][:attributes][:image][:credit][:author]).to eq("joshua_forbes")
    expect(@background[:data][:attributes][:image][:credit][:logo]).to be_a(String)
    expect(@background[:data][:attributes][:image][:credit][:logo]).to eq("https://unsplash-assets.imgix.net/marketing/press-logotype.svg?auto=format&fit=crop&q=60")
    
  end
end