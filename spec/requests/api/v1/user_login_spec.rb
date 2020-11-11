require 'rails_helper'

RSpec.describe 'User login' do

  it 'User can log in' do
    user_creation = {email: 'gerdsen@email.com',
            password: 'password',
            password_confirmation: 'password'
           }
    header = {'CONTENT_TYPE' => 'application/json'}
    post '/api/v1/users', headers: header, params: JSON.generate(user_creation)
    
    user_login_params = {email: user_creation[:email], password: user_creation[:password]}
    header = {'CONTENT_TYPE' => 'application/json'}
    post '/api/v1/sessions', headers: header, params: JSON.generate(user_login_params)

    user_json = JSON.parse(response.body, symbolize_names: true)
    user = User.last
    
    expect(user_json[:data][:type]).to eq("user")
    expect(user_json[:data][:id]).to eq(user.id.to_s)
    expect(user_json[:data][:attributes][:email]).to be_a(String)
    expect(user_json[:data][:attributes][:email]).to eq(user.email)
    expect(user_json[:data][:attributes][:api_key]).to be_a(String)
    expect(user_json[:data][:attributes][:api_key]).to eq(user.api_key)
  end
  
  it 'An error is returned if log in information is invalid' do
    user_creation = {email: 'gerdsen@email.com',
            password: 'password',
            password_confirmation: 'password'
           }
    header = {'CONTENT_TYPE' => 'application/json'}
    post '/api/v1/users', headers: header, params: JSON.generate(user_creation)
    
    user_login_params = {email: user_creation[:email], password: "1234"}
    header = {'CONTENT_TYPE' => 'application/json'}
    post '/api/v1/sessions', headers: header, params: JSON.generate(user_login_params)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(response.body).to eq("Invalid Credentials")
  
  end
end