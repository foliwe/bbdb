require 'faker'

# progressbar = ProgressBar.create(
#     title: 'Creating Users',
#     total: BUSINESSES_TO_CREATE
# )

# 20.times do 
#     Category.create!(name: Faker::Company.industry)
# end

User.create!(first_name: "Foliwe", 
                  last_name: "Example",
                   email: "foliwe@example.com",
                   password: 'password',
                   password_confirmation:"password")
                                     
User.create!(first_name: "Akuma", 
                  last_name: "Example",
                   email: "akuma@example.com",
                   password: 'password',
                   password_confirmation:"password")

User.create!(first_name: "Patrick", 
                  last_name: "Example",
                   email: "patrick@example.com",
                   password: 'password',
                   password_confirmation:"password")

#     9.times do 
#         Business.create!(business_name: Faker::Company.name,
#             user_id: rand(1...4),number_of_employee:rand(1...101),category_id:rand(1...31),accepts_partnership: rand(2),business_email: Faker::Internet.email,business_address: Faker::Address.street_address,description: Faker::Lorem.paragraph(sentence_count: 2),mobile: Faker::PhoneNumber.cell_phone_in_e164,phone: Faker::PhoneNumber.cell_phone,zip_code: Faker::Address.zip_code )
# end

puts "3 Static Users created"
puts "+++++++++++++++++++++++++++++++++++++++++"