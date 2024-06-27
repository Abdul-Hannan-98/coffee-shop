# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create 10 users
10.times do |i|
  User.create(
    name: "User #{i + 1}",
    email: "user#{i + 1}@example.com"
  )
end

# Create 10 items
10.times do |i|
  Item.create(
    name: "Item #{i + 1}",
    price: rand(1.0..10.0).round(2),
    tax_rate: rand(5.0..20.0).round(2),
    quantity_avaliable: rand(1..50)
  )
end
