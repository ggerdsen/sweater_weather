require 'rails_helper'

describe "Forecast" do
  before :each do
    VCR.use_cassette("forecast_data", allow_playback_repeats: true, :record => :new_episodes) do
      get "/api/v1/forecast?location=denver,co"
      expect(response.status).to eq(200)
      expect(response).to be_successful
      @forecast = JSON.parse(response.body, symbolize_names: true)
    end
  end
  
  it "Weather Data" do
    expect(@forecast[:data][:id]).to eq(nil)
    expect(@forecast[:data][:type]).to eq("forecast")
    expect(@forecast[:data][:type]).to be_a(String)
    expect(@forecast[:data][:attributes]).to be_a(Hash)
  end
  
  it "Current Weather" do
    attributes = @forecast[:data][:attributes][:current_weather]
    expect(attributes).to be_a(Hash)
    expect(attributes[:datetime]).to be_a(String)
    expect(attributes[:sunrise]).to be_a(String)
    expect(attributes[:sunset]).to be_a(String)
    expect(attributes[:temperature]).to be_a(Float)
    expect(attributes[:feels_like]).to be_a(Float)
    expect(attributes[:humidity]).to be_a(Integer)
    expect(attributes[:uvi]).to be_a(Float)
    expect(attributes[:visibility]).to be_a(Integer)
    expect(attributes[:conditions]).to be_a(String)
    expect(attributes[:icon]).to be_a(String)
  end

  it "Daily Weather" do
    attributes = @forecast[:data][:attributes][:daily_weather]
    expect(attributes).to be_a(Array)
    attributes.each do |attribute|
      expect(attribute[:date]).to be_a(String)
      expect(attribute[:sunrise]).to be_a(String)
      expect(attribute[:sunset]).to be_a(String)
      expect(attribute[:max_temp]).to be_a(Float)
      expect(attribute[:min_temp]).to be_a(Float)
      expect(attribute[:conditions]).to be_a(String)
      expect(attribute[:icon]).to be_a(String)
    end
  end
  
  it "Hourly Weather" do
    attributes = @forecast[:data][:attributes][:daily_weather]
    expect(attributes).to be_a(Array)
    attributes.each do |attribute|
      expect(attribute[:date]).to be_a(String)
      expect(attribute[:sunrise]).to be_a(String)
      expect(attribute[:sunset]).to be_a(String)
      expect(attribute[:max_temp]).to be_a(Float)
      expect(attribute[:min_temp]).to be_a(Float)
      expect(attribute[:conditions]).to be_a(String)
      expect(attribute[:icon]).to be_a(String)
    end
  end
end