class Subscription < ApplicationRecord
  has_many :teas, dependent: :destroy
end
