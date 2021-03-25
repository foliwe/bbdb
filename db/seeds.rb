# USERS_TO_CREATE = 20
 BUSINESSES_TO_CREATE = 10


Dir[Rails.root.join('db','seeds','*.rb')].sort.each do |file|
    require file
end
# require 'faker'
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Category.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

#  puts "20 Categories created"

#  puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

# foli= User.create!(fullname: Faker::Name.name, email: "foliwe@example.com",password: 'password')
# akuma=User.create!(fullname: Faker::Name.name, email: "akuma@example.com",password: 'password')
# pattrick=User.create!(fullname: Faker::Name.name, email: "patrick@example.com",password: 'password')

# puts "3 users created"
# puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

# 9.times do 
#     Business.create!(business_name: Faker::Company.name,user_id: rand(1...4),number_of_employee:rand(1...101),category_id:rand(1...21),accepts_partnership: rand(2),business_email: Faker::Internet.email)
# end
# puts "9 Bisinesses created"



