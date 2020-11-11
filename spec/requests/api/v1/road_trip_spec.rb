require 'rails_helper'

RSpec.describe 'Road Trip' do
  it 'It tells me travel time and destination weather for a road trip' do
    VCR.use_cassette('road_trip') do
      new_user = {email: 'traveller@email.com',
                  password: 'password',
                  password_confirmation: 'password'}
              
      user = User.create!(new_user)
      
      trip_plan = {origin: "Evergreen,CO",
                   destination: "Lafayette,LA",
                   api_key: user.api_key}
                   
      header = { "CONTENT_TYPE" => "application/json" }
      post '/api/v1/road_trip', headers: header, params: JSON.generate(trip_plan)
      trip_info = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(trip_info).to be_a(Hash)
      expect(trip_info[:data]).to be_a(Hash)
      expect(trip_info[:data][:id]).to eq(nil)
      expect(trip_info[:data][:type]).to be_a(String)
      expect(trip_info[:data][:type]).to eq("road_trip")
      expect(trip_info[:data][:attributes]).to be_a(Hash)
      expect(trip_info[:data][:attributes][:start_city]).to be_a(String)
      expect(trip_info[:data][:attributes][:start_city]).to eq("Evergreen,CO")
      expect(trip_info[:data][:attributes][:end_city]).to be_a(String)
      expect(trip_info[:data][:attributes][:end_city]).to eq("Lafayette,LA")
      expect(trip_info[:data][:attributes][:travel_time]).to be_a(String)
      expect(trip_info[:data][:attributes][:travel_time]).to eq("18 hours, 0 minutes")
      expect(trip_info[:data][:attributes][:weather_at_eta]).to be_a(Hash)
      expect(trip_info[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
      expect(trip_info[:data][:attributes][:weather_at_eta][:temperature]).to eq(72.7)
      expect(trip_info[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
      expect(trip_info[:data][:attributes][:weather_at_eta][:conditions]).to eq("few clouds")
    end
  end
  
  it 'Impossible route' do
    VCR.use_cassette('impossible_road_trip') do
      new_user = {email: 'traveller@email.com',
                  password: 'password',
                  password_confirmation: 'password'}
              
      user = User.create!(new_user)
      
      trip_plan = {origin: "Evergreen,CO",
                   destination: "Honolulu,HI",
                   api_key: user.api_key}
                   
      header = { "CONTENT_TYPE" => "application/json" }
      post '/api/v1/road_trip', headers: header, params: JSON.generate(trip_plan)
      trip_info = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(trip_info).to be_a(Hash)
      expect(trip_info[:data]).to be_a(Hash)
      expect(trip_info[:data][:id]).to eq(nil)
      expect(trip_info[:data][:type]).to be_a(String)
      expect(trip_info[:data][:type]).to eq("road_trip")
      expect(trip_info[:data][:attributes]).to be_a(Hash)
      expect(trip_info[:data][:attributes][:start_city]).to be_a(String)
      expect(trip_info[:data][:attributes][:start_city]).to eq("Evergreen,CO")
      expect(trip_info[:data][:attributes][:end_city]).to be_a(String)
      expect(trip_info[:data][:attributes][:end_city]).to eq("Honolulu,HI")
      expect(trip_info[:data][:attributes][:travel_time]).to be_a(String)
      expect(trip_info[:data][:attributes][:travel_time]).to eq("impossible route")
      expect(trip_info[:data][:attributes][:weather_at_eta]).to be_a(String)
      expect(trip_info[:data][:attributes][:weather_at_eta]).to eq("")
    end
  end
end