# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Restaurant.destroy_all
Post.destroy_all
Comment.destroy_all
PostComment.destroy_all

puts "Your data is destroyed"

10.times do
    User.create(email: Faker::Internet.email, password: 1234, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, imageurl: "https://dl.airtable.com/.attachmentThumbnails/1ee9b5b0a9245281bd7857835ef256d8/ebb993b2" )
end
puts "1"
10.times do
    Restaurant.create(name: Faker::Restaurant.name , description: Faker::Restaurant.description, website: "www.yelp.com", phonenumber: Faker::PhoneNumber.cell_phone , imageurl: "https://dl.airtable.com/.attachmentThumbnails/e90acd19635b360ba75a5e0d47cbef0f/d76972aa")
end

puts "2"

3.times do
    Post.create(title: Faker::Food.dish , message: Faker::Food.description, restaurant_id: Restaurant.all.sample.id)
end
puts "3"

3.times do
    Comment.create(message: Faker::Restaurant.review, user_id: User.all.sample.id)
end
puts "4"

3.times do
    PostComment.create(post_id: Post.all.sample.id , comment_id: Comment.all.sample.id)
end

puts "Your data is seeded"








