# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Review.destroy_all
Booking.destroy_all
Flat.destroy_all
User.destroy_all


10.times do
  User.create!(email: Faker::Internet.email, password: "123123")
end

20.times do
  Flat.create!(name: "some name", user: User.sample)
end


User.each do |user|
  rand(1..4).times do
    Flat.create!(name: "some name", user: user)
    rand(1..3).times do
      Booking.create!()
    end
  end
end
