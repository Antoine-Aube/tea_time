require 'rails_helper'

RSpec.describe 'find a users subsccriptions endpoint' do
  describe "when I send a request to '/api/v1/find_subscriptions" do
    it "sends a response with all the tea subscriptions a user has" do 
      customer = Customer.create(id: 1, first_name: "John", last_name: "Doe", email: "john@gmail.com", address: "123 John Street")
      tea1 = Tea.create(title: "Green Tea", description: "Green tea", temperature: 75, brew_time: 5)
      tea2 = Tea.create(title: "Blue Tea", description: "blue tea", temperature: 90, brew_time: 5)
      subscription1 = customer.subscriptions.create(customer_id: customer.id, title: "Single Tea")
      subscription2 = customer.subscriptions.create(customer_id: customer.id, title: "Single Tea")
      tea_subscription1 = TeaSubscription.create(tea_id: tea1.id, subscription_id: subscription1.id)
      tea_subscription2 = TeaSubscription.create(tea_id: tea2.id, subscription_id: subscription2.id)

      request = {
        "customer_id": "1"
      }

      get "/api/v1/subscriptions", params: {customer_id: 1}

      expect(response).to be_successful
      expect(response.status).to eq(200)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:data].count).to eq(2)
    end 

    it "sends a response with an error if the user does not exist" do 
      get "/api/v1/subscriptions", params: {customer_id: 1}

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:message]).to eq("Customer not found")
    end

    it "sends a response with an error if the user has no subscriptions" do
      customer = Customer.create(id: 1, first_name: "John", last_name: "Doe", email: "john@gmail.com", address: "123 John Street")
      get "/api/v1/subscriptions", params: {customer_id: 1}

      expect(response).to be_successful
      expect(response.status).to eq(200)
      
      response_body = JSON.parse(response.body, symbolize_names: true)  
      expect(response_body[:message]).to eq("The customer has no subscriptions")
    end
  end
end 