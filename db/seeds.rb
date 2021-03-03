# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
 	User.create!(email: Faker::Internet.free_email , password: "test123")
end



User.all.each do |user|
 	Itinerary.create!(user_id: user.id , city: Faker::Address.city, duration: 5, title: "nice holday #{user}")
end

20.times do
	Place.create!(name: Faker::Movies::LordOfTheRings.location ,description: Faker::Lorem.paragraph(sentence_count: 2))
end

