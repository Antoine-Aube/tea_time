Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/api/v1/subscribe", to: "api/v1/subscriptions#create"
  patch "/api/v1/cancel_subscription", to: "api/v1/subscriptions#update"
  get "/api/v1/subscriptions", to: "api/v1/subscriptions#index"

end
