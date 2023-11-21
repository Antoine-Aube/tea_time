class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.float :price, default: 20.00
      t.integer :status, default: 0
      t.integer :frequency, default: 0
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
