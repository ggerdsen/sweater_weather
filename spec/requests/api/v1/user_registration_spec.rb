require 'rails_helper'

RSpec.describe 'User Registration' do

  it 'A user can register' do
    user = {email: 'garrett@email.com',
            password: 'password',
            password_confirmation: 'password'
           }
    header = {'CONTENT_TYPE' => 'application/json'}

    post '/api/v1/users', headers: header, params: JSON.generate(user)

    user_json = JSON.parse(response.body, symbolize_names: true)
    user = User.last

    expect(response).to be_successful
    expect(response.status).to eq(200)
    
    expect(user_json[:data][:type]).to eq("user")
    expect(user_json[:data]).to have_key(:id)
    expect(user_json[:data][:id]).to eq(user.id.to_s)
    expect(user_json[:data]).to have_key(:attributes)
    expect(user_json[:data][:attributes][:email]).to eq(user.email)
    expect(user_json[:data][:attributes]).to have_key(:api_key)
    expect(user_json[:data][:attributes].keys.count).to eq(2)
    expect(user_json[:data][:attributes]).to have_key(:email)
    expect(user_json[:data][:attributes][:api_key]).to eq(user.api_key)
    expect(user_json[:data][:attributes]).to_not have_key(:password)
    expect(user_json[:data][:attributes]).to_not have_key(:password_confirmation)
  end
  
  xit 'An error is returned if registration information is invalid' do
    user = {email: 'garrett@email.com',
            password: 'password',
            password_confirmation: '1234456'
           }
    header = {'CONTENT_TYPE' => 'application/json'}

    binding.pry
    post '/api/v1/users', headers: header, params: JSON.generate(user)
    user_json = JSON.parse(response.body, symbolize_names: true)
    user = User.last

    expect(response).to be_successful
    expect(response.status).to eq(400)
  
  end
end