# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Subscription.destroy_all 
Customer.destroy_all 
Tea.destroy_all

5.times do 
  Customer.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email, 
    address: Faker::Address.full_address 
  )
end

customers = Customer.all

10.times do
  Tea.create!(
    title: Faker::Tea.variety,
    description: Faker::Tea.type,
    temperature: Faker::Number.within(range: 185..210),
    brew_time: Faker::Number.within(range: 5..10)
  )
end

teas = Tea.all

Subscription.create!(
  customer_id: customers[0].id,
  tea_id: teas[0].id,
  title: teas[0].title,
  price: Faker::Number.decimal(l_digits: 2),
  status: Faker::Number.within(range: 0..1),
  frequency: Faker::Number.within(range: 0..1)
)

Subscription.create!(
  customer_id: customers[0].id,
  tea_id: teas[1].id,
  title: teas[1].title,
  price: Faker::Number.decimal(l_digits: 2),
  status: Faker::Number.within(range: 0..1),
  frequency: Faker::Number.within(range: 0..1)
)

Subscription.create!(
  customer_id: customers[1].id,
  tea_id: teas[2].id,
  title: teas[2].title,
  price: Faker::Number.decimal(l_digits: 2),
  status: Faker::Number.within(range: 0..1),
  frequency: Faker::Number.within(range: 0..1)
)

Subscription.create!(
  customer_id: customers[1].id,
  tea_id: teas[3].id,
  title: teas[3].title,
  price: Faker::Number.decimal(l_digits: 2),
  status: Faker::Number.within(range: 0..1),
  frequency: Faker::Number.within(range: 0..1)
)

Subscription.create!(
  customer_id: customers[2].id,
  tea_id: teas[4].id,
  title: teas[4].title,
  price: Faker::Number.decimal(l_digits: 2),
  status: Faker::Number.within(range: 0..1),
  frequency: Faker::Number.within(range: 0..1)
)

Subscription.create!(
  customer_id: customers[2].id,
  tea_id: teas[5].id,
  title: teas[5].title,
  price: Faker::Number.decimal(l_digits: 2),
  status: Faker::Number.within(range: 0..1),
  frequency: Faker::Number.within(range: 0..1)
)

Subscription.create!(
  customer_id: customers[3].id,
  tea_id: teas[6].id,
  title: teas[6].title,
  price: Faker::Number.decimal(l_digits: 2),
  status: Faker::Number.within(range: 0..1),
  frequency: Faker::Number.within(range: 0..1)
)

Subscription.create!(
  customer_id: customers[3].id,
  tea_id: teas[7].id,
  title: teas[7].title,
  price: Faker::Number.decimal(l_digits: 2),
  status: Faker::Number.within(range: 0..1),
  frequency: Faker::Number.within(range: 0..1)
)

Subscription.create!(
  customer_id: customers[4].id,
  tea_id: teas[8].id,
  title: teas[8].title,
  price: Faker::Number.decimal(l_digits: 2),
  status: Faker::Number.within(range: 0..1),
  frequency: Faker::Number.within(range: 0..1)
)

Subscription.create!(
  customer_id: customers[4].id,
  tea_id: teas[9].id,
  title: teas[9].title,
  price: Faker::Number.decimal(l_digits: 2),
  status: Faker::Number.within(range: 0..1),
  frequency: Faker::Number.within(range: 0..1)
)

