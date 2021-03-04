# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Itinerary.destroy_all
Place.destroy_all


require 'json'
require 'open-uri'

url_lisbon = 'https://www.triposo.com/api/20201111/poi.json?location_id=Lisbon&count=20&fields=name,coordinates,snippet,images&account=C5KPFAI5&token=1cqamu68ut4x8he5cmoglzkjmkyddw1n'
place_serialized = open(url_lisbon).read
place = JSON.parse(place_serialized)

puts "Creating places"
place_1 = Place.new(
    name: place["results"][0]["name"],
    category: "Landmarks",
    lat: place["results"][0]["coordinates"]["latitude"],
    lng: place["results"][0]["coordinates"]["longitude"],
    description: place["results"][0]["snippet"],
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/torre-de-belem/a/poi-sig/401037/360366",
    )
photo = place["results"][0]["images"][0]["source_url"]
file = URI.open(photo)
place_1.photo.attach(io: file, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_1.save
puts "finish 1"
sleep(3)


place_2 = Place.new(
    name: place["results"][1]["name"],
    category: "Landmarks",
    lat: place["results"][1]["coordinates"]["latitude"], 
    lng: place["results"][1]["coordinates"]["longitude"],
    description: place["results"][1]["snippet"],
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/activities/lisbon-3-hour-walking-tour-around-avenida-da-liberdade/a/pa-act/v-7526P6/360366",
    )
photo_2 = place["results"][1]["images"][0]["source_url"]
file_2 = URI.open(photo_2)
place_2.photo.attach(io: file_2, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_2.save
puts "finish 2"
sleep(3)

place_3 = Place.new(
    name: place["results"][2]["name"],
    category: "Museums",
    lat: place["results"][2]["coordinates"]["latitude"],
    lng: place["results"][2]["coordinates"]["longitude"],
    description: place["results"][2]["snippet"],
    link_url: "https://www.berardocollection.com/",
    )
photo_3 = place["results"][2]["images"][0]["source_url"]
file_3 = URI.open(photo_3)
place_3.photo.attach(io: file_3, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_3.save
puts "finish 3"
sleep(3)

place_4 = Place.new(
    name: place["results"][3]["name"],
    category: "Museums",
    lat: place["results"][3]["coordinates"]["latitude"],
    lng: place["results"][3]["coordinates"]["longitude"],
    description: place["results"][3]["snippet"],
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/mosteiro-dos-jeronimos/a/poi-sig/400967/360366",
    )
photo_4 = place["results"][3]["images"][0]["source_url"]
file_4 = URI.open(photo_4)
place_4.photo.attach(io: file_4, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_4.save
puts "finish 4"
sleep(3)

place_5 = Place.new(
    name: place["results"][4]["name"],
    category: "Museums",
    lat: place["results"][4]["coordinates"]["latitude"],
    lng: place["results"][4]["coordinates"]["longitude"],
    description: place["results"][4]["snippet"],
    link_url: "https://padraodosdescobrimentos.pt/en/inicio/",
    )
photo_5 = place["results"][4]["images"][0]["source_url"]
file_5 = URI.open(photo_5)
place_5.photo.attach(io: file_5, filename: 'lisbon.jpg', content_type: 'image/jpg')    
place_5.save
puts "finish 5"
sleep(3)

#place_6 has been deleted because doesn't work

place_7 = Place.new(
    name: place["results"][6]["name"],
    category: "Museums",
    lat: place["results"][6]["coordinates"]["latitude"],
    lng: place["results"][6]["coordinates"]["longitude"],
    description: place["results"][6]["snippet"],
    link_url: "https://www.lisbon.net/archaeology-museum",
    )
photo_7 = place["results"][6]["images"][0]["source_url"]
file_7 = URI.open(photo_7)
place_7.photo.attach(io: file_7, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_7.save
puts "finish 7"
sleep(3)

place_8 = Place.new(
    name: place["results"][7]["name"],
    category: "Museums",
    lat: place["results"][7]["coordinates"]["latitude"],
    lng: place["results"][7]["coordinates"]["longitude"],
    description: place["results"][7]["snippet"], 
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/museu-nacional-de-arte-antiga/a/poi-sig/400999/360366",
    )
photo_8 = place["results"][7]["images"][0]["source_url"]
file_8 = URI.open(photo_8)
place_8.photo.attach(io: file_8, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_8.save
puts "finish 8"
sleep(3)

place_9 = Place.new(
    name: place["results"][8]["name"], 
    category: "Landmarks", 
    lat: place["results"][8]["coordinates"]["latitude"], 
    lng: place["results"][8]["coordinates"]["longitude"], 
    description: place["results"][8]["snippet"], 
    link_url: "https://lisbonlisboaportugal.com/lisbon-sights/cristo-rei-christ-statue-lisbon.html",
    )
photo_9 = place["results"][8]["images"][0]["source_url"]
file_9 = URI.open(photo_9)
place_9.photo.attach(io: file_9, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_9.save
puts "finish 9"
sleep(3)

place_10 = Place.new(
    name: place["results"][9]["name"], 
    category: "Museums", 
    lat: place["results"][9]["coordinates"]["latitude"], 
    lng: place["results"][9]["coordinates"]["longitude"], 
    description: place["results"][9]["snippet"], 
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/castelo-de-sao-jorge/a/poi-sig/400925/360366",
    )
photo_10 = place["results"][9]["images"][0]["source_url"]
file_10 = URI.open(photo_10)
place_10.photo.attach(io: file_10, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_10.save
puts "finish 10"
sleep(3)


place_11 = Place.new(
    name: place["results"][10]["name"], 
    category: "Landmarks", 
    lat: place["results"][10]["coordinates"]["latitude"], 
    lng: place["results"][10]["coordinates"]["longitude"], 
    description: place["results"][10]["snippet"], 
    link_url: "http://www.palacioajuda.gov.pt/en-GB/palace/ContentDetail.aspx"
)
photo_11 = place["results"][10]["images"][0]["source_url"]
file_11 = URI.open(photo_11)
place_11.photo.attach(io: file_11, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_11.save

place_12 = Place.new(
    name: place["results"][11]["name"], 
    category: "Landmarks", 
    lat: place["results"][11]["coordinates"]["latitude"], 
    lng: place["results"][11]["coordinates"]["longitude"], 
    description: place["results"][11]["snippet"], 
    link_url: "https://www.lisbon.net/santa-justa-lift",
    )
photo_12 = place["results"][11]["images"][0]["source_url"]
file_12 = URI.open(photo_12)
place_12.photo.attach(io: file_12, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_12.save

place_13 = Place.new(
    name: place["results"][12]["name"], 
    category: "Activities", 
    lat: place["results"][12]["coordinates"]["latitude"], 
    lng: place["results"][12]["coordinates"]["longitude"], 
    description: place["results"][12]["snippet"], 
    link_url: "https://hcp.pt/",
    )
photo_13 = place["results"][12]["images"][0]["source_url"]
file_13 = URI.open(photo_13)
place_13.photo.attach(io: file_13, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_13.save



puts "Finish"