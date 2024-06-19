# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

TAGS = %w[urgent secret rigolo].freeze

puts 'destroying all tags...'
Tag.destroy_all
puts 'destroying all messages...'
Message.destroy_all
puts 'destroying all users...'
User.destroy_all

TAGS.each do |tag|
  Tag.create!(tag:)
end

puts 'tags created!'

User.create!(
  email: 'goku@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Son',
  last_name: 'Goku'
)

9.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

puts 'users created!'

# Create Messages
20.times do
  Message.create!(
    content: Faker::Lorem.sentence,
    user: User.order('RANDOM()').first,
    tag: Tag.order('RANDOM()').first
  )
end

puts 'messages created!'
