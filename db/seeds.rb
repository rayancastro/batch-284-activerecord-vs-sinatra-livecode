require 'faker'

puts "Cleaning the database"

Restaurant.destroy_all
User.destroy_all


puts "Generating users"

User.create(username: 'admin', password: 'admin')

puts "You have #{User.count} users"


puts "Generating fake restaurants"
10.times do

  Restaurant.create(
    name: Faker::Restaurant.name ,
    city: Faker::Address.city
  )

end


puts "You have #{Restaurant.count} restaurants"
