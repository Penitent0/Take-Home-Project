FactoryBot.define do
  factory :subscription do
    title { Faker::Tea.variety }
    price { Faker::Number.decimal(l_digits: 2) }
    status { Faker::Number.within(range: 0..1) }
    frequency { Faker::Number.within(range: 0..1) }
  end
end