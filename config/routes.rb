Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/subscribe", to: "subscriptions#create"
  patch "/cancel_subscription", to: "subscriptions#cancel"
  get "/subscriptions", to: "subscriptions#index"

end
