require 'rails_helper'

describe "Weather" do
  it "Item index" do
    
    get '/api/v1/forecast?location=denver,co'
    
  end
end