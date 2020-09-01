require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ShoppingCart.destroy_all
Product.destroy_all
Company.destroy_all
User.destroy_all



puts "Starting creating users..."

50.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, document: %w(938.166.070-04 085.377.620-24 204.142.880-50 693.469.990-47 589.247.960-97 179.850.920-21 245.784.060-08 400.757.280-10 146.037.620-03 129.156.930-80).sample, phone: Faker::PhoneNumber.cell_phone, address: Faker::Address.full_address, email: Faker::Internet.email, password: "123456")
end

puts "#{User.count} users created!"

puts "Starting creating companies..."

10.times do
  Company.create(cnpj: %w(50.260.485/0001-20 41.017.941/0001-15 15.433.887/0001-89 56.139.931/0001-20 20.809.660/0001-25 42.077.071/0001-32).sample, name: Faker::Cannabis.brand, user: User.all.sample)
end

puts "#{Company.count} companies created!"

puts "Starting creating products..."

15.times do
  Product.create(name: Faker::Cannabis.strain, price: %w(60 65 70 80 95 100 110 240 250).sample.to_i, activity: ["day trip", "dive"].sample, capacity: (60..110).to_a.sample, status: [true, false].sample, company: Company.all.sample)
end

puts "#{Product.count} products created!"
