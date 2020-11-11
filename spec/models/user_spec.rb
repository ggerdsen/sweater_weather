require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
  
  # user = {email: 'user@email.com',
  #         password: 'password',
  #         password_confirmation: 'password'
  #        }
  #
  # User.create!(user)
  #
  # expect(User.last.email).to be_a(String)
  # expect(User.last.password_digest).to be_a(String)
  # expect(User.last.api_key).to be_a(String)
end
