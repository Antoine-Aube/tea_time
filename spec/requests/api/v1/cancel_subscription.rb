require 'rails_helper'

RSpec.describe 'Delete subsccription endpoint' do
  describe "when I send a req uest to  '/api/v1/delete_subscription/:id" do 
    it "sets the subscription status to 'canceled" do 
      create(:customer, id: 1)
      create(:tea, id: 1)
      create(:subscription, id: 1, customer_id: 1, title: "Single Tea")
      tea_subscription = TeaSubscriptions.create(tea_id: 1, subscription_id: 1)
      request = {
        "subscription_id": "1",
        "status" => "1"
      }
      patch "/api/v1/cancel_subscription", params: request, as: :json

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(Subscription.last.status).to eq("canceled")
    end
  end
end