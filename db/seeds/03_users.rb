require 'faker'

progressbar = ProgressBar.create(
    title: 'Creating Users',
    total: USERS_TO_CREATE
)
USERS_TO_CREATE.times do

    User.create!(title:Faker::Name.prefix ,
                  first_name: Faker::Name.first_name , 
                  last_name: Faker::Name.last_name ,
                    email: Faker::Internet.safe_email,
                    password: 'password',
                    terms: rand(1),
                    password_confirmation:"password")
    progressbar.increment
    end
puts "#{USERS_TO_CREATE}  Randon Users created"
puts "+++++++++++++++++++++++++++++++++++++++++"