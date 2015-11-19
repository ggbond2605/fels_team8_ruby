# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: 1)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

category = Category.create(name: "Basic 1000", description: "1000 word in daily life")

100.times do
  content = Faker::Lorem.word
  category_id = rand(1..2)
  Word.create! content: content, category_id: category_id
end

categories = Category.all
30.times do
  categories.each do |category|
    content = Faker::Lorem.word
    category.words.create content: content
  end
end

words = Word.all
3.times do
  words.each do |word|
    content = Faker::Lorem.word
    word.word_answers.create content: content
  end
end

words.each do |word|
  content = Faker::Lorem.word
  word.word_answers.create content: content, correct: true
end
