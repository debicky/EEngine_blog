# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Author.find_by_email('admin@admin.com').nil?
  author = Author.new(
    email: "admin@admin.com",
    first_name: "FirstName",
    last_name: "LastName",
    password: "password",
    password_confirmation: "password"
  )
  author.save
end


10.times do |i|
  Author.create!(first_name: Faker::Name.unique.first_name,
               last_name: Faker::Name.unique.last_name,
               email: Faker::Internet.unique.email,
               password: 'password',
               password_confirmation: 'password'
               )
end