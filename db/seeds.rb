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
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/torre-de-belem/a/poi-sig/401037/360366"
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

#I have added extra seed below.

place_14 = Place.new(
    name: place["results"][13]["name"], 
    category: "Museums", 
    lat: place["results"][13]["coordinates"]["latitude"], 
    lng: place["results"][13]["coordinates"]["longitude"], 
    description: place["results"][12]["snippet"], 
    link_url: "https://www.golisbon.com/sight-seeing/belem-palace.html",
    )
photo_14 = place["results"][13]["images"][0]["source_url"]
file_14 = URI.open(photo_14)
place_14.photo.attach(io: file_14, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_14.save

place_15 = Place.new(
    name: place["results"][14]["name"], 
    category: "Museums", 
    lat: place["results"][14]["coordinates"]["latitude"], 
    lng: place["results"][14]["coordinates"]["longitude"], 
    description: place["results"][14]["snippet"], 
    link_url: "https://www.slbenfica.pt/en-us/loja/bilhetes/estadio-e-museu",
    )
photo_15 = place["results"][14]["images"][0]["source_url"]
file_15 = URI.open(photo_15)
place_15.photo.attach(io: file_15, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_15.save

place_16 = Place.new(
    name: place["results"][15]["name"], 
    category: "Landmarks", 
    lat: place["results"][15]["coordinates"]["latitude"], 
    lng: place["results"][15]["coordinates"]["longitude"], 
    description: place["results"][15]["snippet"], 
    link_url: "http://www.pestanapalacelisbon.com/",
    )
photo_16 = place["results"][15]["images"][0]["source_url"]
file_16 = URI.open(photo_16)
place_16.photo.attach(io: file_16, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_16.save

place_17 = Place.new(
    name: place["results"][16]["name"], 
    category: "Landmarks", 
    lat: place["results"][16]["coordinates"]["latitude"], 
    lng: place["results"][16]["coordinates"]["longitude"], 
    description: place["results"][16]["snippet"], 
    link_url: "https://www.visitlisboa.com/en/places/arco-da-rua-augusta",
    )
photo_137= place["results"][16]["images"][0]["source_url"]
file_17 = URI.open(photo_17)
place_17.photo.attach(io: file_17, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_17.save

place_18 = Place.new(
    name: place["results"][17]["name"], 
    category: "Activities", 
    lat: place["results"][17]["coordinates"]["latitude"], 
    lng: place["results"][17]["coordinates"]["longitude"], 
    description: place["results"][17]["snippet"], 
    link_url: "https://www.ccb.pt/",
    )
photo_18 = place["results"][17]["images"][0]["source_url"]
file_18 = URI.open(photo_18)
place_18.photo.attach(io: file_18, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_18.save

place_19 = Place.new(
    name: place["results"][18]["name"], 
    category: "Landmarks", 
    lat: place["results"][18]["coordinates"]["latitude"], 
    lng: place["results"][18]["coordinates"]["longitude"], 
    description: place["results"][18]["snippet"], 
    link_url: "https://www.lisbonportugaltourism.com/guide/mosteiro-de-sao-vicente-de-fora.html",
    )
photo_19 = place["results"][18]["images"][0]["source_url"]
file_19 = URI.open(photo_19)
place_19.photo.attach(io: file_19, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_19.save

puts "Finish"

# I add extra seed for PORTO #

url_porto = 'https://www.triposo.com/api/20201111/poi.json?location_id=Porto&count=20&fields=images,name,coordinates,snippet&account=C5KPFAI5&token=1cqamu68ut4x8he5cmoglzkjmkyddw1n'
place_serialized = open(url_porto).read
place = JSON.parse(place_serialized)

puts "Creating places"
place_1 = Place.new(
    name: place["results"][0]["name"],
    category: "Museums",
    lat: place["results"][0]["coordinates"]["latitude"],
    lng: place["results"][0]["coordinates"]["longitude"],
    description: place["results"][0]["snippet"],
    link_url: "https://www.serralves.pt/en/"
    )
photo = place["results"][0]["images"][0]["source_url"]
file = URI.open(photo)
place_1.photo.attach(io: file, filename: 'porto.jpg', content_type: 'image/jpg')
place_1.save
puts "finish 1"
sleep(3)


place_2 = Place.new(
    name: place["results"][1]["name"],
    category: "Landmarks",
    lat: place["results"][1]["coordinates"]["latitude"], 
    lng: place["results"][1]["coordinates"]["longitude"],
    description: place["results"][1]["snippet"],
    link_url: "https://en.wikipedia.org/wiki/Dom_Lu%C3%ADs_I_Bridge"
photo_2 = place["results"][1]["images"][0]["source_url"]
file_2 = URI.open(photo_2)
place_2.photo.attach(io: file_2, filename: 'porto.jpg', content_type: 'image/jpg')
place_2.save
puts "finish 2"
sleep(3)

place_3 = Place.new(
    name: place["results"][2]["name"],
    category: "Landmarks",
    lat: place["results"][2]["coordinates"]["latitude"], 
    lng: place["results"][2]["coordinates"]["longitude"],
    description: place["results"][2]["snippet"],
    link_url: "https://www.visitportugal.com/en/content/mosteiro-da-serra-do-pilar"
photo_3 = place["results"][2]["images"][0]["source_url"]
file_3 = URI.open(photo_3)
place_3.photo.attach(io: file_3, filename: 'porto.jpg', content_type: 'image/jpg')
place_3.save
puts "finish 3"
sleep(3)

place_4 = Place.new(
    name: place["results"][3]["name"],
    category: "Activities",
    lat: place["results"][3]["coordinates"]["latitude"], 
    lng: place["results"][3]["coordinates"]["longitude"],
    description: place["results"][3]["snippet"],
    link_url: "http://www.casadamusica.com/en/agenda#tab=lista"
photo_4 = place["results"][3]["images"][0]["source_url"]
file_4 = URI.open(photo_4)
place_4.photo.attach(io: file_4, filename: 'porto.jpg', content_type: 'image/jpg')
place_4.save
puts "finish 4"
sleep(3)


place_5 = Place.new(
    name: place["results"][4]["name"],
    category: "Museums",
    lat: place["results"][4]["coordinates"]["latitude"], 
    lng: place["results"][4]["coordinates"]["longitude"],
    description: place["results"][4]["snippet"],
    link_url: "http://www.torredosclerigos.pt/en/"
photo_5 = place["results"][4]["images"][0]["source_url"]
file_5 = URI.open(photo_5)
place_5.photo.attach(io: file_5, filename: 'porto.jpg', content_type: 'image/jpg')
place_5.save
puts "finish 5"
sleep(3)

place_6 = Place.new(
    name: place["results"][5]["name"],
    category: "Landmarks",
    lat: place["results"][5]["coordinates"]["latitude"], 
    lng: place["results"][5]["coordinates"]["longitude"],
    description: place["results"][5]["snippet"],
    link_url: "https://palaciodabolsa.com/en/intro/"
photo_6 = place["results"][5]["images"][0]["source_url"]
file_6 = URI.open(photo_6)
place_6.photo.attach(io: file_6, filename: 'porto.jpg', content_type: 'image/jpg')
place_6.save
puts "finish 6"
sleep(3)

place_7 = Place.new(
    name: place["results"][6]["name"],
    category: "Landmarks",
    lat: place["results"][6]["coordinates"]["latitude"], 
    lng: place["results"][6]["coordinates"]["longitude"],
    description: place["results"][6]["snippet"],
    link_url: "https://www.visitportugal.com/en/content/se-catedral-do-porto"
photo_7 = place["results"][6]["images"][0]["source_url"]
file_7 = URI.open(photo_7)
place_7.photo.attach(io: file_7, filename: 'porto.jpg', content_type: 'image/jpg')
place_7.save
puts "finish 7"
sleep(3)

place_8 = Place.new(
    name: place["results"][7]["name"],
    category: "Museums",
    lat: place["results"][7]["coordinates"]["latitude"], 
    lng: place["results"][7]["coordinates"]["longitude"],
    description: place["results"][7]["snippet"],
    link_url: "https://www.portugalvisitor.com/porto-attractions/paco-episcopal"
photo_8 = place["results"][7]["images"][0]["source_url"]
file_8 = URI.open(photo_8)
place_8.photo.attach(io: file_8, filename: 'porto.jpg', content_type: 'image/jpg')
place_8.save
puts "finish 8"
sleep(3)

place_9 = Place.new(
    name: place["results"][8]["name"],
    category: "Landmarks",
    lat: place["results"][8]["coordinates"]["latitude"], 
    lng: place["results"][8]["coordinates"]["longitude"],
    description: place["results"][8]["snippet"],
    link_url: "http://www.pousadapalaciodofreixo.com/pt/"
photo_9 = place["results"][8]["images"][0]["source_url"]
file_9 = URI.open(photo_9)
place_9.photo.attach(io: file_9, filename: 'porto.jpg', content_type: 'image/jpg')
place_9.save
puts "finish 9"
sleep(3)

place_10 = Place.new(
    name: place["results"][9]["name"],
    category: "Museums",
    lat: place["results"][9]["coordinates"]["latitude"], 
    lng: place["results"][9]["coordinates"]["longitude"],
    description: place["results"][9]["snippet"],
    link_url: "https://localporto.com/casa-infante-house-of-prince-porto/"
photo_10 = place["results"][9]["images"][0]["source_url"]
file_10 = URI.open(photo_10)
place_10.photo.attach(io: file_10, filename: 'porto.jpg', content_type: 'image/jpg')
place_10.save
puts "finish 10"
sleep(3)