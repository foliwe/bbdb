# require 'faker'

# progressbar = ProgressBar.create(
#     title: 'Creating Users',
#     total: USERS_TO_CREATE
# )
# USERS_TO_CREATE.times do

#     User.create!(fullname: Faker::Name.name, 
#                     email: Faker::Internet.safe_email,
#                     password: 'password',
#                     password_confirmation:"password")
#     progressbar.increment
#     end
# puts "#{USERS_TO_CREATE}  Randon Users created"
# puts "+++++++++++++++++++++++++++++++++++++++++"