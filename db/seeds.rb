# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Author.find_by_email('test@test.com').nil?
  author = Author.new(
    email: "test@test.com",
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

300.times do |i|
  post = Post.new
  post.title = Faker::Lorem.sentence(word_count: 3, random_words_to_add: 7)
  post.body = Faker::Lorem.paragraph_by_chars(number: 100)
  post.author = Author.find(Faker::Number.within(range: 1..10))
  post.published = [true, false].sample
  post.save
  
  pseudo_rng = Random.new
  
  (pseudo_rng.rand(8)).times do |i|
    comment = post.comments.build(body: Faker::Lorem.paragraph_by_chars(number: 20),
    author: Author.find(1 + pseudo_rng.rand(10)))
    comment.save
  end
end