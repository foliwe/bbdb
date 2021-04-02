 require 'faker'

# Continent.create!(name: "Africa")
# Continent.create!(name: "Asia")
# Continent.create!(name: "Europe")
# Continent.create!(name: "North America")
# Continent.create!(name: "South America")
40.times do 
    Category.create!(name: Faker::Company.industry)
end