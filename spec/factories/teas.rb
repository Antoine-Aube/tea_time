FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea.type }
    temperature { Faker::Number.between(from: 0, to: 100) }
    brew_time { Faker::Number.between(from: 0, to: 10) }
  end
end
