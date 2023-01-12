FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea.type}
    temperature { Faker::Number.within(range: 185..210) }
    brew_time { Faker::Number.within(range: 5..10) }
  end
end