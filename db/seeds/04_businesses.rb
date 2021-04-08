require 'faker'

progressbar = ProgressBar.create(
    title: 'Creating Businesses',
    total: BUSINESSES_TO_CREATE
)


BUSINESSES_TO_CREATE.times do 
    Business.create!(business_name: Faker::Company.name,
    user_id: rand(1..20),
    number_of_employee:rand(1...101),
    category_ids:rand(1...BUSINESSES_TO_CREATE+1),
    accepts_partnership: rand(2),
    business_email: Faker::Internet.email,
    founded: Faker::Date.between(from: '2009-09-23', to: '2021-09-25'),
    website: Faker::Internet.domain_name(domain: "foliwe"),
    description: Faker::Lorem.paragraph(sentence_count: 4),
    ceo: Faker::Name.name,
    about_text: Faker::Lorem.sentence
                    
    )
                    
    progressbar.increment
  end
  
  puts "#{BUSINESSES_TO_CREATE}  Businesses created"
  puts "+++++++++++++++++++++++++++++++++++++++++"
  
  
