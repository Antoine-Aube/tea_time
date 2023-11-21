# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Customer.destroy_all
Tea.destroy_all

3.times do 
  FactoryBot.create(:customer)
end

3.times do 
  FactoryBot.create(:tea)
end

customer4 = Customer.create(first_name: "John", last_name: "Doe", email: "john@gmail.com", address: "123 John Street")
tea1 = Tea.create(title: "Green Tea", description: "Green tea", temperature: 75, brew_time: 5)
tea2 = Tea.create(title: "Blue Tea", description: "blue tea", temperature: 90, brew_time: 5)
subscription1 = Subscription.create(customer_id: customer4.id, title: "Single Tea")
subscription2 = Subscription.create(customer_id: customer4.id, title: "Single Tea")
tea_subscription1 = TeaSubscription.create(tea_id: tea1.id, subscription_id: subscription1.id)
tea_subscription2 = TeaSubscription.create(tea_id: tea2.id, subscription_id: subscription2.id)