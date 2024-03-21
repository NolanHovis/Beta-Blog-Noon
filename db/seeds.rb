# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

10.times do 
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, username: Faker::Name.first_name, password: 'password', password_confirmation: 'password')
end

User.find_each do |user|
    rand(1..5).times do 
        blog = user.blogs.create!(
            title: 'title',
            content: 'content',
            created_at: 1.month.ago
        )
        rand(1..10).times do |i|
    
            liker = User.offset(rand(User.count)).first
    
            liker.likes.create!(likeable: blog)
        end
    end

end