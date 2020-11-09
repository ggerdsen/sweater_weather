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
    
    expect(@response[:data][:id]).to eq ("null")
    expect(@response[:data][:type]).to eq ("trail")
    expect(@response[:data]).to have_key(:attributes)
    expect(@response[:data][:attributes]).to have_key(:location)
    expect(@response[:data][:attributes][:location]).to eq("denver,co")
    
    expect(@response[:data][:attributes]).to have_key(:forecast)
    expect(@response[:data][:attributes][:forecast]).to be_a(Hash)
    expect(@response[:data][:attributes][:forecast][:summary]).to be_a(String)
    expect(@response[:data][:attributes][:forecast][:temperature]).to be_a(String)
    
    expect(@response[:data][:attributes][:forecast]).to_not have_key(:conditions)
    expect(@response[:data][:attributes][:forecast]).to_not have_key(:datetime)
    expect(@response[:data][:attributes][:forecast]).to_not have_key(:feels_like)
    expect(@response[:data][:attributes][:forecast]).to_not have_key(:humidity)
    expect(@response[:data][:attributes][:forecast]).to_not have_key(:icon)
    expect(@response[:data][:attributes][:forecast]).to_not have_key(:sunrise)
    expect(@response[:data][:attributes][:forecast]).to_not have_key(:sunset)
    expect(@response[:data][:attributes][:forecast]).to_not have_key(:uvi)
    expect(@response[:data][:attributes][:forecast]).to_not have_key(:visibility)
    
    expect(@response[:data][:attributes]).to have_key(:trails)
    
    @response[:data][:attributes][:trails].each do |trail|
      expect(trail).to have_key(:name)
      expect(trail[:name]).to be_a(String)
      expect(trail).to have_key(:summary)
      expect(trail[:summary]).to be_a(String)
      expect(trail).to have_key(:difficulty)
      expect(trail[:difficulty]).to be_a(String)
      expect(trail).to have_key(:location)
      expect(trail[:location]).to be_a(String)
      expect(trail).to have_key(:distance_to_trail)
      expect(trail[:distance_to_trail]).to be_a(String)
      
      expect(trail).to_not have_key(:type)
      expect(trail).to_not have_key(:stars)
      expect(trail).to_not have_key(:starVotes)
      expect(trail).to_not have_key(:url)
      expect(trail).to_not have_key(:imgSqSmall)
      expect(trail).to_not have_key(:imgSmall)
      expect(trail).to_not have_key(:imgSmallMed)
      expect(trail).to_not have_key(:imgMedium)
      expect(trail).to_not have_key(:length)
      expect(trail).to_not have_key(:ascent)
      expect(trail).to_not have_key(:descent)
      expect(trail).to_not have_key(:high)
      expect(trail).to_not have_key(:low)
      expect(trail).to_not have_key(:longitude)
      expect(trail).to_not have_key(:latitude)
      expect(trail).to_not have_key(:conditionStatus)
      expect(trail).to_not have_key(:conditionDetails)
      expect(trail).to_not have_key(:conditionDate)
    end
    
  end
end