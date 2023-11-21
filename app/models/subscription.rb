class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :tea_subscriptions
  validates :title, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :frequency, presence: true

  enum status: %w[active canceled]
  enum frequency: %w[weekly monthly yearly]
end
