FactoryBot.define do
  factory :subscription do
    title { Faker::Coffee.blend_name }
    price { Faker::Number.decimal(l_digits: 2) }
    status { Faker::Number.between(from: 0, to: 1) }
    frequency { Faker::Number.between(from: 0, to: 2) }
  end
end
