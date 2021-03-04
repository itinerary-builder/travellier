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
place_1.save

puts "finish 1"

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
    link_url: "https://lisbonlisboaportugal.com/lisbon-sights/cristo-rei-christ-statue-lisbon.html",
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

# from here i created new places

place_11 = Place.new(
    name: place["results"][10]["name"], 
    category: "Museums", 
    lat: place["results"][10]["coordinates"]["latitude"], 
    lng: place["results"][10]["coordinates"]["longitude"], 
    description: place["results"][10]["snippet"], 
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/castelo-de-sao-jorge/a/poi-sig/400925/360366",
    )
place_11.save

place_12 = Place.new(
    name: place["results"][10]["name"], 
    category: "Museums", 
    lat: place["results"][11]["coordinates"]["latitude"], 
    lng: place["results"][11]["coordinates"]["longitude"], 
    description: place["results"][11]["snippet"], 
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/castelo-de-sao-jorge/a/poi-sig/400925/360366",
    )
place_12.save

place_13 = Place.new(
    name: place["results"][12]["name"], 
    category: "Museums", 
    lat: place["results"][12]["coordinates"]["latitude"], 
    lng: place["results"][12]["coordinates"]["longitude"], 
    description: place["results"][12]["snippet"], 
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/castelo-de-sao-jorge/a/poi-sig/400925/360366",
    )
place_13.save

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