# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Database for user
User.create(name: "stal", email: "stal@hotmail.com", password: "stal", role: 1)

user = {}
user['password'] = 'stal'

ActiveRecord::Base.transaction do
  20.times do 
    user['name'] = Faker::Name.name
    user['email'] = Faker::Internet.email

    User.create(user)
  end
end 

# Seed Recipes
auction = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    auction['title'] = Faker::Zelda.item
    auction['category'] = ["House", "Vehicle", "Electronics", "Sport", "Clothing", "Other"].sample
    auction['amount'] = rand(1..50)
    auction['user_id'] = uids.sample

    Auction.create(auction)
  end
end