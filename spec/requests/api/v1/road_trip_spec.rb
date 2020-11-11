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
      binding.binding.pry
      trip_info = JSON.parse(response.body, symbolize_names: true)
      
      
      
    end
  end
end