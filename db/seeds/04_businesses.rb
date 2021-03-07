require 'faker'

progressbar = ProgressBar.create(
    title: 'Creating Businesses',
    total: BUSINESSES_TO_CREATE
)

BUSINESSES_TO_CREATE.times do 
    Business.create!(business_name: Faker::Company.name,
                    user_id: rand(1...4),
                    number_of_employee:rand(1...101),
                    #category_id:rand(1...BUSINESSES_TO_CREATE+1),
                    accepts_partnership: rand(2),
                    #business_email: Faker::Internet.email,
                    #business_address: Faker::Address.street_address,
                    description: Faker::Lorem.paragraph(sentence_count: 2),
                    #mobile: Faker::PhoneNumber.cell_phone_in_e164,
                    #phone: Faker::PhoneNumber.cell_phone,
                    #zip_code: Faker::Address.zip_code,
    )
                    
    progressbar.increment
end

puts "#{BUSINESSES_TO_CREATE}  Businesses created"
puts "+++++++++++++++++++++++++++++++++++++++++"



 
 