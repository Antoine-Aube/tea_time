class Api::V1::SubscriptionsController < ApplicationController
  def create
    request_body = JSON.parse(request.body.read, symbolize_names: true)
    begin
      customer = Customer.find(params[:customer_id])
      tea = Tea.find(params[:tea_id])
      subscription = customer.subscriptions.create(title: request_body[:title])
      tea_subscription = TeaSubscription.create(tea_id: tea.id, subscription_id: subscription.id)
      render json: {message: "Subscription created successfully"}, status: 201
    rescue ActiveRecord::RecordNotFound
      render json: {message: "Subscription not created, please try again"}, status: 400
    end
  end
  
  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions
    if customer && !subscriptions.empty?
      render json: SubscriptionsSerializer.new(subscriptions), status: 200
    else
       render json: {message: "Either the customer does not exist of the customer has no subscriptions"}, status: 400
    end 
  end
  
  def update
    begin
      subscription = Subscription.find(params[:subscription_id])
      subscription.update(status: params[:status].to_i)
      render json: {message: "Subscription updated successfully"}, status: 200
    rescue ActiveRecord::RecordNotFound
      render json: {message: "Subscription not updated, please try again"}, status: 400
    end
  end

  private

  def create_subscription

  end
end