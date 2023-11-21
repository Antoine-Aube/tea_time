class CreateJoinTableSubscriptionTea < ActiveRecord::Migration[7.0]
  def change
    create_join_table :subscriptions, :teas do |t|
      t.index :subscription_id
      t.index :tea_id
    end
  end
end
