class Api::V1::SubscriptionsController < ApplicationController
  def create
    request_body = JSON.parse(request.body.read, symbolize_names: true)
    customer = Customer.find(params[:customer_id])
    tea = Tea.find(params[:tea_id])
    subscription = customer.subscriptions.create(title: request_body[:title])
    tea_subscription = TeaSubscriptions.create(tea_id: tea.id, subscription_id: subscription.id)
    if subscription.save && tea_subscription.save
      render json: {message: "Subscription created successfully"}, status: 201
    else
      render json: {message: "Subscription not created, please try again"}, status: 400
    end
  end
  
  def index
    
  end
  
  def update
    subscription = Subscription.find(params[:subscription_id])
    subscription.update(status: params[:status].to_i)
    if subscription.save
      render json: {message: "Subscription updated successfully"}, status: 200
    else
      render json: {message: "Subscription not updated, please try again"}, status: 400
    end
  end

  private

  def create_subscription

  end
end