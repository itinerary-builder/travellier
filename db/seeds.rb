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

puts 'Creating 4 places...'

place_1 = Place.new(
    name: "Mosteiro dos Jerónimos",
    category: "Landmarks",
    lat: 38.69778,
    lng: -9.20611,
    description: "Belém’s undisputed heart-stealer is this Unesco-listed monastery. The mosteiro is the stuff of pure fantasy: a fusion of Diogo de Boitaca’s creative vision and the spice and pepper dosh of Manuel I, who commissioned it to trumpet Vasco da Gama’s discovery of a sea route to India in 1498.",
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/mosteiro-dos-jeronimos/a/poi-sig/400967/360366",
    )
place_1.save!

place_2 = Place.new(
    name: "Castelo de São Jorge",
    category: "Museums",
    lat: 38.71443,
    lng: -9.13347,
    description: "Towering dramatically above Lisbon, these mid-11th-century hilltop fortifications sneak into almost every snapshot. Roam its snaking ramparts and pine-shaded courtyards for superlative views over the city’s red rooftops to the river. Three guided tours daily (in Portuguese, English and Spanish), at 10.30am, 1pm and 4pm, are included in the admission price (additional tours available).",
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/castelo-de-sao-jorge/a/poi-sig/400925/360366",
    )
place_2.save!

place_3 = Place.new(
    name: "Historic & Trendy Lisbon Walking Tour",
    category: "Activities",
    lat: 38.695503,
    lng: -9.208354,
    description: "Ready to embrace your bohemian side? Lisbon is a fascinating city with something for everyone, but if you’re after an experience that’s a little more off-beat, this is the tour for you. Explore four unique Lisbon neighbourhoods, each with their own quirky charm and personality. History, architecture, epic views, and a few local snacks combine for a relaxed, fun-filled afternoon exploring the city through the eyes of a local.",
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/activities/historic-trendy-lisbon-walking-tour/a/pa-act/ua-PTUD/360366",
    )
place_3.save!

place_4 = Place.new(
    name: "Mercado da Ribeira",
    category: "Restaurants",
    lat: 38.70641,
    lng: -9.14723,
    description: "Doing trade in fresh fruit and veg, fish and flowers since 1892, this domed market hall has been the word on everyone's lips since Time Out transformed half of it into a gourmet food court in 2014. Now it's Lisbon in chaotic culinary microcosm: Garrafeira Nacional wines, Café de São Bento steaks, Manteigaria Silva cold cuts and Michelin-star chef creations from Henrique Sá Pessoa.",
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/restaurants/mercado-da-ribeira/a/poi-eat/401107/360366",
    )
place_4.save!


puts 'Finished!'

require "faker"
10.times do
 	User.create!(email: Faker::Internet.free_email , password: "test123")
end



User.all.each do |user|
 	Itinerary.create!(user_id: user.id , city: Faker::Address.city, duration: 5, title: "nice holday #{user}")
end


require 'json'
require 'open-uri'

url_lisbon = 'https://www.triposo.com/api/20201111/poi.json?location_id=Lisbon&fields=name,coordinates,snippet&account=C5KPFAI5&token=1cqamu68ut4x8he5cmoglzkjmkyddw1n'
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
place_1.save

place_2 = Place.new(
    name: place["results"][1]["name"],
    category: "Landmarks",
    lat: place["results"][1]["coordinates"]["latitude"], 
    lng: place["results"][1]["coordinates"]["longitude"],
    description: place["results"][1]["snippet"],
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/activities/lisbon-3-hour-walking-tour-around-avenida-da-liberdade/a/pa-act/v-7526P6/360366",
    )
place_2.save

place_3 = Place.new(
    name: place["results"][2]["name"],
    category: "Museums",
    lat: place["results"][2]["coordinates"]["latitude"],
    lng: place["results"][2]["coordinates"]["longitude"],
    description: place["results"][2]["snippet"],
    link_url: "https://www.berardocollection.com/",
    )
place_3.save


place_4 = Place.new(
    name: place["results"][3]["name"],
    category: "Museums",
    lat: place["results"][3]["coordinates"]["latitude"],
    lng: place["results"][3]["coordinates"]["longitude"],
    description: place["results"][3]["snippet"],
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/mosteiro-dos-jeronimos/a/poi-sig/400967/360366",
    )
place_4.save

place_5 = Place.new(
    name: place["results"][4]["name"],
    category: "Museums",
    lat: place["results"][4]["coordinates"]["latitude"],
    lng: place["results"][4]["coordinates"]["longitude"],
    description: place["results"][4]["snippet"],
    link_url: "https://padraodosdescobrimentos.pt/en/inicio/",
    )
place_5.save

place_6 = Place.new(
    name: place["results"][5]["name"],
    category: "Museums",
    lat: place["results"][5]["coordinates"]["latitude"],
    lng: place["results"][5]["coordinates"]["longitude"],
    description: place["results"][5]["snippet"],
    link_url: "https://www.oceanario.pt/en/",
    )
place_6.save

place_7 = Place.new(
    name: place["results"][6]["name"],
    category: "Museums",
    lat: place["results"][6]["coordinates"]["latitude"],
    lng: place["results"][6]["coordinates"]["longitude"],
    description: place["results"][6]["snippet"],
    link_url: "https://www.lisbon.net/archaeology-museum",
    )
place_7.save

place_8 = Place.new(
    name: place["results"][7]["name"],
    category: "Museums",
    lat: place["results"][7]["coordinates"]["latitude"],
    lng: place["results"][7]["coordinates"]["longitude"],
    description: place["results"][7]["snippet"], 
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/museu-nacional-de-arte-antiga/a/poi-sig/400999/360366",
    )
place_8.save

place_9 = Place.new(
    name: place["results"][8]["name"], 
    category: "Landmarks", 
    lat: place["results"][8]["coordinates"]["latitude"], 
    lng: place["results"][8]["coordinates"]["longitude"], 
    description: place["results"][8]["snippet"], 
    link_url: "hhttps://lisbonlisboaportugal.com/lisbon-sights/cristo-rei-christ-statue-lisbon.html",
    )
place_9.save

place_10 = Place.new(
    name: place["results"][9]["name"], 
    category: "Museums", 
    lat: place["results"][9]["coordinates"]["latitude"], 
    lng: place["results"][9]["coordinates"]["longitude"], 
    description: place["results"][9]["snippet"], 
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/castelo-de-sao-jorge/a/poi-sig/400925/360366",
    )
place_10.save

puts "Finish"