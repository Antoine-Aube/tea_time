require 'rails_helper'

RSpec.describe 'Create subsccription endpoint' do
  describe "when I send a request to '/api/v1/create_subscription/:id" do
    it "responds with a 204 status code and a message that the user is created" do 
      create(:customer, id: 1)
      create(:tea, id: 1)
      request = {
        "tea_id": "1",
        "customer_id": "1",
        "title": "Single Tea"
      }
      post "/api/v1/subscribe", params: request, as: :json

      expect(response).to be_successful
      expect(response.status).to eq(201)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:message]).to eq("Subscription created successfully")
    end
  end
end