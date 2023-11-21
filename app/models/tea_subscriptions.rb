class TeaSubscriptions < ApplicationRecord
  belongs_to :subscription
  belongs_to :tea
end