# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = []
# create 100000 users
1000.times do
  users << {
    username: Faker::Internet.username,
    password: "password",
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    email: Faker::Internet.email
  }
end

items = []
# create 200000 items (2 per user)
2000.times do
  items << {
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence,
    price: Faker::Commerce.price,
    user_id: rand(1..1000)
  }
end

User.create(users)
Item.create(items)