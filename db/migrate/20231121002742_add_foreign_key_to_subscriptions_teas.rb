class AddForeignKeyToSubscriptionsTeas < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :subscriptions_teas, :subscriptions
    add_foreign_key :subscriptions_teas, :teas
  end
end
