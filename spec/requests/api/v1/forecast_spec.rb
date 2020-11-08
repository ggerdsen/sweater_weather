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
    attributes = @forecast[:data][:attributes][:hourly_weather]
    expect(attributes).to be_a(Array)
    attributes.each do |attribute|
      expect(attribute[:time]).to be_a(String)
      expect(attribute[:wind_speed]).to be_a(Float)
      expect(attribute[:wind_direction]).to be_a(String)
      expect(attribute[:conditions]).to be_a(String)
      expect(attribute[:icon]).to be_a(String)
      expect(attribute[:temperature]).to be_a(Float)
    end
  end
  
  it "Only requested data is returned" do
    current_attributes = @forecast[:data][:attributes][:current_weather]
    daily_attributes = @forecast[:data][:attributes][:daily_weather]
    hourly_attributes = @forecast[:data][:attributes][:hourly_weather]
    expect(current_attributes).to_not have_key(:dt)
    expect(current_attributes).to_not have_key(:pressure)
    expect(current_attributes).to_not have_key(:dew_point)
    expect(current_attributes).to_not have_key(:clouds)
    expect(current_attributes).to_not have_key(:wind_speed)
    expect(current_attributes).to_not have_key(:wind_deg)
    
    
    daily_attributes.each do |day|
      expect(day).to_not have_key(:dt)
      expect(day).to_not have_key(:temp)
      expect(day).to_not have_key(:feels_like)
      expect(day).to_not have_key(:pressure)
      expect(day).to_not have_key(:humidity)
      expect(day).to_not have_key(:dewpoint)
      expect(day).to_not have_key(:wind_speed)
      expect(day).to_not have_key(:wind_deg)
      expect(day).to_not have_key(:weather)
      expect(day).to_not have_key(:clouds)
      expect(day).to_not have_key(:pop)
      expect(day).to_not have_key(:uvi)
    end
    
    hourly_attributes.each do |day|
      expect(day).to_not have_key(:dt)
      expect(day).to_not have_key(:temp)
      expect(day).to_not have_key(:feels_like)
      expect(day).to_not have_key(:pressure)
      expect(day).to_not have_key(:humidity)
      expect(day).to_not have_key(:dewpoint)
      expect(day).to_not have_key(:wind_deg)
      expect(day).to_not have_key(:weather)
      expect(day).to_not have_key(:pop)
    end

  end
end