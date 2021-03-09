# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require "http"
require "optparse"

start = Time.now

# User.destroy_all
# Itinerary.destroy_all
# Place.destroy_all



API_KEY = ENV['YELP_API_KEY']
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"
SEARCH_LIMIT = 10

def search(location)
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      location: location,
      limit: SEARCH_LIMIT
    }
  
    response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
    response.parse
  end

restaurants = []
array_from_yelp = search('lisbon')

array_from_yelp["businesses"].each do |resto|
    restaurants << {
        name: resto["name"],
        category: "Restaurants",
        lat: resto["coordinates"]["latitude"],
        lng: resto["coordinates"]["longitude"],
        description: resto["categories"].map { |e| e["title"] }.join(", "),
        link_url: resto["url"],
        image_url: resto["image_url"]
    }
end

restaurants.each_with_index do |resto, index|
    restaurant = Place.new(
        name: resto[:name],
        category: resto[:category],
        lat: resto[:lat],
        lng: resto[:lng],
        description: resto[:description],
        link_url: resto[:link_url],
        city: "lisbon"
    )
    file = URI.open(resto[:image_url])
    restaurant.photo.attach(io: file, filename: "#{resto[:name].downcase}.jpg", content_type: 'image/jpg')
    restaurant.save
    puts "Restaurant #{index + 1} finished..."
end

# array of restaurants for PORTO #

array_from_yelp_porto = search('porto, pt')
restaurants = []
array_from_yelp_porto["businesses"].each_with_index do |resto, index|
    restaurants << {
        name: resto["name"],
        category: "Restaurants",
        lat: resto["coordinates"]["latitude"],
        lng: resto["coordinates"]["longitude"],
        description: resto["categories"].map { |e| e["title"] }.join(", "),
        link_url: resto["url"],
        image_url: resto["image_url"]
    }
end

restaurants.each_with_index do |resto, index|
    restaurant = Place.new(
        name: resto[:name],
        category: resto[:category],
        lat: resto[:lat],
        lng: resto[:lng],
        description: resto[:description],
        link_url: resto[:link_url],
        city: "porto"
    )
    file = URI.open(resto[:image_url])
    restaurant.photo.attach(io: file, filename: "#{resto[:name].downcase}.jpg", content_type: 'image/jpg')
    restaurant.save
    puts "Porto Restaurant #{index + 1} finished..."
end

# Array of restaurants for COIMBRA #

array_from_yelp_coimbra = search('coimbra')
restaurants = []
array_from_yelp_coimbra["businesses"].each do |resto|
    restaurants << {
        name: resto["name"],
        category: "Restaurants",
        lat: resto["coordinates"]["latitude"],
        lng: resto["coordinates"]["longitude"],
        description: resto["categories"].map { |e| e["title"] }.join(", "),
        link_url: resto["url"],
        image_url: resto["image_url"]
    }
end

restaurants.each_with_index do |resto, index|
    restaurant = Place.new(
        name: resto[:name],
        category: resto[:category],
        lat: resto[:lat],
        lng: resto[:lng],
        description: resto[:description],
        link_url: resto[:link_url],
        city: "coimbra"
    )
    file = URI.open(resto[:image_url])
    restaurant.photo.attach(io: file, filename: "#{resto[:name].downcase}.jpg", content_type: 'image/jpg')
    restaurant.save
    puts "Coimbra Restaurant #{index + 1} finished..."
end


# Array of restaurants for EVORA #


array_from_yelp_evora = search('evora')
restaurants = []
array_from_yelp_evora["businesses"].each_with_index do |resto, index|
    restaurants << {
        name: resto["name"],
        category: "Restaurants",
        lat: resto["coordinates"]["latitude"],
        lng: resto["coordinates"]["longitude"],
        description: resto["categories"].map { |e| e["title"] }.join(", "),
        link_url: resto["url"],
        image_url: resto["image_url"]
    }
end

restaurants.each_with_index do |resto, index|
    restaurant = Place.new(
        name: resto[:name],
        category: resto[:category],
        lat: resto[:lat],
        lng: resto[:lng],
        description: resto[:description],
        link_url: resto[:link_url],
        city: "evora"
    )
    file = URI.open(resto[:image_url])
    restaurant.photo.attach(io: file, filename: "#{resto[:name].downcase}.jpg", content_type: 'image/jpg')
    restaurant.save
    puts "Evora Restaurant #{index + 1} finished..."
end


# #Array of restaurants for ALGARVE #


array_from_yelp_algarve = search('algarve')
restaurants = []
array_from_yelp_algarve["businesses"].each do |resto|
    restaurants << {
        name: resto["name"],
        category: "Restaurants",
        lat: resto["coordinates"]["latitude"],
        lng: resto["coordinates"]["longitude"],
        description: resto["categories"].map { |e| e["title"] }.join(", "),
        link_url: resto["url"],
        image_url: resto["image_url"]
    }
end

restaurants.each_with_index do |resto, index|
    restaurant = Place.new(
        name: resto[:name],
        category: resto[:category],
        lat: resto[:lat],
        lng: resto[:lng],
        description: resto[:description],
        link_url: resto[:link_url],
        city: "algarve"
    )
    file = URI.open(resto[:image_url])
    restaurant.photo.attach(io: file, filename: "#{resto[:name].downcase}.jpg", content_type: 'image/jpg')
    restaurant.save
    puts "Algarve Restaurant #{index + 1} finished..."
end


# Crating new activities/museums/landmarks from TRIPOSO API for Portugal trips #

# LISBON #

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
    city: "lisbon",
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/torre-de-belem/a/poi-sig/401037/360366"
    )
photo = place["results"][0]["images"][0]["source_url"]
file = URI.open(photo)
place_1.photo.attach(io: file, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_1.save
puts "Finish place 1..."


place_2 = Place.new(
    name: place["results"][1]["name"],
    category: "Landmarks",
    lat: place["results"][1]["coordinates"]["latitude"], 
    lng: place["results"][1]["coordinates"]["longitude"],
    description: place["results"][1]["snippet"],
    city: "lisbon",
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/activities/lisbon-3-hour-walking-tour-around-avenida-da-liberdade/a/pa-act/v-7526P6/360366",
    )
photo_2 = place["results"][1]["images"][0]["source_url"]
file_2 = URI.open(photo_2)
place_2.photo.attach(io: file_2, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_2.save
puts "Finish place 2..."

place_3 = Place.new(
    name: place["results"][2]["name"],
    category: "Museums",
    lat: place["results"][2]["coordinates"]["latitude"],
    lng: place["results"][2]["coordinates"]["longitude"],
    description: place["results"][2]["snippet"],
    city: "lisbon",
    link_url: "https://www.berardocollection.com/",
    )
photo_3 = place["results"][2]["images"][0]["source_url"]
file_3 = URI.open(photo_3)
place_3.photo.attach(io: file_3, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_3.save
puts "Finish place 3..."

place_4 = Place.new(
    name: place["results"][3]["name"],
    category: "Museums",
    lat: place["results"][3]["coordinates"]["latitude"],
    lng: place["results"][3]["coordinates"]["longitude"],
    description: place["results"][3]["snippet"],
    city: "lisbon",
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/mosteiro-dos-jeronimos/a/poi-sig/400967/360366",
    )
photo_4 = place["results"][3]["images"][0]["source_url"]
file_4 = URI.open(photo_4)
place_4.photo.attach(io: file_4, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_4.save
puts "Finish place 4..."

place_5 = Place.new(
    name: place["results"][4]["name"],
    category: "Museums",
    lat: place["results"][4]["coordinates"]["latitude"],
    lng: place["results"][4]["coordinates"]["longitude"],
    description: place["results"][4]["snippet"],
    city: "lisbon",
    link_url: "https://padraodosdescobrimentos.pt/en/inicio/",
    )
photo_5 = place["results"][4]["images"][0]["source_url"]
file_5 = URI.open(photo_5)
place_5.photo.attach(io: file_5, filename: 'lisbon.jpg', content_type: 'image/jpg')    
place_5.save
puts "Finish place 5..."

puts "place_6 has been deleted because doesn't work"

place_7 = Place.new(
    name: place["results"][6]["name"],
    category: "Museums",
    lat: place["results"][6]["coordinates"]["latitude"],
    lng: place["results"][6]["coordinates"]["longitude"],
    description: place["results"][6]["snippet"],
    city: "lisbon",
    link_url: "https://www.lisbon.net/archaeology-museum",
    )
photo_7 = place["results"][6]["images"][0]["source_url"]
file_7 = URI.open(photo_7)
place_7.photo.attach(io: file_7, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_7.save
puts "Finish place 7..."

place_8 = Place.new(
    name: place["results"][7]["name"],
    category: "Museums",
    lat: place["results"][7]["coordinates"]["latitude"],
    lng: place["results"][7]["coordinates"]["longitude"],
    description: place["results"][7]["snippet"], 
    city: "lisbon",
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/museu-nacional-de-arte-antiga/a/poi-sig/400999/360366",
    )
photo_8 = place["results"][7]["images"][0]["source_url"]
file_8 = URI.open(photo_8)
place_8.photo.attach(io: file_8, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_8.save
puts "Finish place 8..."

place_9 = Place.new(
    name: place["results"][8]["name"], 
    category: "Landmarks", 
    lat: place["results"][8]["coordinates"]["latitude"], 
    lng: place["results"][8]["coordinates"]["longitude"], 
    description: place["results"][8]["snippet"], 
    city: "lisbon",
    link_url: "https://lisbonlisboaportugal.com/lisbon-sights/cristo-rei-christ-statue-lisbon.html",
    )
photo_9 = place["results"][8]["images"][0]["source_url"]
file_9 = URI.open(photo_9)
place_9.photo.attach(io: file_9, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_9.save
puts "Finish place 9..."

place_10 = Place.new(
    name: place["results"][9]["name"], 
    category: "Museums", 
    lat: place["results"][9]["coordinates"]["latitude"], 
    lng: place["results"][9]["coordinates"]["longitude"], 
    description: place["results"][9]["snippet"], 
    city: "lisbon",
    link_url: "https://www.lonelyplanet.com/portugal/lisbon/attractions/castelo-de-sao-jorge/a/poi-sig/400925/360366",
    )
photo_10 = place["results"][9]["images"][0]["source_url"]
file_10 = URI.open(photo_10)
place_10.photo.attach(io: file_10, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_10.save
puts "Finish place 10..."


place_11 = Place.new(
    name: place["results"][10]["name"], 
    category: "Landmarks", 
    lat: place["results"][10]["coordinates"]["latitude"], 
    lng: place["results"][10]["coordinates"]["longitude"], 
    description: place["results"][10]["snippet"],
    city: "lisbon", 
    link_url: "http://www.palacioajuda.gov.pt/en-GB/palace/ContentDetail.aspx"
)
photo_11 = place["results"][10]["images"][0]["source_url"]
file_11 = URI.open(photo_11)
place_11.photo.attach(io: file_11, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_11.save
puts "Finish place 11..."

place_12 = Place.new(
    name: place["results"][11]["name"], 
    category: "Landmarks", 
    lat: place["results"][11]["coordinates"]["latitude"], 
    lng: place["results"][11]["coordinates"]["longitude"], 
    description: place["results"][11]["snippet"], 
    city: "lisbon",
    link_url: "https://www.lisbon.net/santa-justa-lift",
    )
photo_12 = place["results"][11]["images"][0]["source_url"]
file_12 = URI.open(photo_12)
place_12.photo.attach(io: file_12, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_12.save
puts "Finish place 12..."

place_13 = Place.new(
    name: place["results"][12]["name"], 
    category: "Activities", 
    lat: place["results"][12]["coordinates"]["latitude"], 
    lng: place["results"][12]["coordinates"]["longitude"], 
    description: place["results"][12]["snippet"], 
    city: "lisbon",
    link_url: "https://hcp.pt/",
    )
photo_13 = place["results"][12]["images"][0]["source_url"]
file_13 = URI.open(photo_13)
place_13.photo.attach(io: file_13, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_13.save
puts "Finish place 13..."

# #I have added extra seed below.

place_14 = Place.new(
    name: place["results"][13]["name"], 
    category: "Museums", 
    lat: place["results"][13]["coordinates"]["latitude"], 
    lng: place["results"][13]["coordinates"]["longitude"], 
    description: place["results"][12]["snippet"], 
    city: "lisbon",
    link_url: "https://www.golisbon.com/sight-seeing/belem-palace.html",
    )
photo_14 = place["results"][13]["images"][0]["source_url"]
file_14 = URI.open(photo_14)
place_14.photo.attach(io: file_14, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_14.save
puts "Finish place 14..."

place_15 = Place.new(
    name: place["results"][14]["name"], 
    category: "Museums", 
    lat: place["results"][14]["coordinates"]["latitude"], 
    lng: place["results"][14]["coordinates"]["longitude"], 
    description: place["results"][14]["snippet"], 
    city: "lisbon",
    link_url: "https://www.slbenfica.pt/en-us/loja/bilhetes/estadio-e-museu",
    )
photo_15 = place["results"][14]["images"][0]["source_url"]
file_15 = URI.open(photo_15)
place_15.photo.attach(io: file_15, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_15.save
puts "Finish place 15..."

place_16 = Place.new(
    name: place["results"][15]["name"], 
    category: "Landmarks", 
    lat: place["results"][15]["coordinates"]["latitude"], 
    lng: place["results"][15]["coordinates"]["longitude"], 
    description: place["results"][15]["snippet"], 
    city: "lisbon",
    link_url: "http://www.pestanapalacelisbon.com/",
    )
photo_16 = place["results"][15]["images"][0]["source_url"]
file_16 = URI.open(photo_16)
place_16.photo.attach(io: file_16, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_16.save
puts "Finish place 16..."

place_17 = Place.new(
    name: place["results"][16]["name"], 
    category: "Landmarks", 
    lat: place["results"][16]["coordinates"]["latitude"], 
    lng: place["results"][16]["coordinates"]["longitude"], 
    description: place["results"][16]["snippet"], 
    city: "lisbon",
    link_url: "https://www.visitlisboa.com/en/places/arco-da-rua-augusta",
    )
    
photo_17= place["results"][16]["images"][0]["source_url"]
file_17 = URI.open(photo_17)
place_17.photo.attach(io: file_17, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_17.save
puts "Finish place 17..."

place_18 = Place.new(
    name: place["results"][17]["name"], 
    category: "Activities", 
    lat: place["results"][17]["coordinates"]["latitude"], 
    lng: place["results"][17]["coordinates"]["longitude"], 
    description: place["results"][17]["snippet"], 
    city: "lisbon",
    link_url: "https://www.ccb.pt/",
    )
photo_18 = place["results"][17]["images"][0]["source_url"]
file_18 = URI.open(photo_18)
place_18.photo.attach(io: file_18, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_18.save
puts "Finish place 18..."

place_19 = Place.new(
    name: place["results"][18]["name"], 
    category: "Landmarks", 
    lat: place["results"][18]["coordinates"]["latitude"], 
    lng: place["results"][18]["coordinates"]["longitude"], 
    description: place["results"][18]["snippet"], 
    city: "lisbon",
    link_url: "https://www.lisbonportugaltourism.com/guide/mosteiro-de-sao-vicente-de-fora.html",
    )
photo_19 = place["results"][18]["images"][0]["source_url"]
file_19 = URI.open(photo_19)
place_19.photo.attach(io: file_19, filename: 'lisbon.jpg', content_type: 'image/jpg')
place_19.save
puts "Finish place 19..."




# # # I add extra seed for PORTO #

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
    city: "porto",
    link_url: "https://www.serralves.pt/en/"
    )
photo = place["results"][0]["images"][0]["source_url"]
file = URI.open(photo)
place_1.photo.attach(io: file, filename: 'porto.jpg', content_type: 'image/jpg')
place_1.save
puts "finish 20"
# sleep(3)


place_2 = Place.new(
    name: place["results"][1]["name"],
    category: "Landmarks",
    lat: place["results"][1]["coordinates"]["latitude"], 
    lng: place["results"][1]["coordinates"]["longitude"],
    description: place["results"][1]["snippet"],
    city: "porto",
    link_url: "https://en.wikipedia.org/wiki/Dom_Lu%C3%ADs_I_Bridge"

    )

photo_2 = place["results"][1]["images"][0]["source_url"]
file_2 = URI.open(photo_2)
place_2.photo.attach(io: file_2, filename: 'porto.jpg', content_type: 'image/jpg')
place_2.save
puts "finish 21"
# sleep(3)

place_3 = Place.new(
    name: place["results"][2]["name"],
    category: "Landmarks",
    lat: place["results"][2]["coordinates"]["latitude"], 
    lng: place["results"][2]["coordinates"]["longitude"],
    description: place["results"][2]["snippet"],
    city: "porto",
    link_url: "https://www.visitportugal.com/en/content/mosteiro-da-serra-do-pilar"
    )
photo_3 = place["results"][2]["images"][0]["source_url"]
file_3 = URI.open(photo_3)
place_3.photo.attach(io: file_3, filename: 'porto.jpg', content_type: 'image/jpg')
place_3.save
puts "finish 22"
# sleep(3)

place_4 = Place.new(
    name: place["results"][3]["name"],
    category: "Activities",
    lat: place["results"][3]["coordinates"]["latitude"], 
    lng: place["results"][3]["coordinates"]["longitude"],
    description: place["results"][3]["snippet"],
    link_url: "http://www.casadamusica.com/en/agenda#tab=lista"
    )
photo_4 = place["results"][3]["images"][0]["source_url"]
file_4 = URI.open(photo_4)
place_4.photo.attach(io: file_4, filename: 'porto.jpg', content_type: 'image/jpg')
place_4.save
puts "finish 23"
# sleep(3)


place_5 = Place.new(
    name: place["results"][4]["name"],
    category: "Museums",
    lat: place["results"][4]["coordinates"]["latitude"], 
    lng: place["results"][4]["coordinates"]["longitude"],
    description: place["results"][4]["snippet"],
    city: "porto",
    link_url: "http://www.torredosclerigos.pt/en/"

    )

photo_5 = place["results"][4]["images"][0]["source_url"]
file_5 = URI.open(photo_5)
place_5.photo.attach(io: file_5, filename: 'porto.jpg', content_type: 'image/jpg')
place_5.save
puts "finish 24"
# sleep(3)

place_6 = Place.new(
    name: place["results"][5]["name"],
    category: "Landmarks",
    lat: place["results"][5]["coordinates"]["latitude"], 
    lng: place["results"][5]["coordinates"]["longitude"],
    description: place["results"][5]["snippet"],
    city: "porto",
    link_url: "https://palaciodabolsa.com/en/intro/"
    )

photo_6 = place["results"][5]["images"][0]["source_url"]
file_6 = URI.open(photo_6)
place_6.photo.attach(io: file_6, filename: 'porto.jpg', content_type: 'image/jpg')
place_6.save
puts "finish 25"
# sleep(3)

place_7 = Place.new(
    name: place["results"][6]["name"],
    category: "Landmarks",
    lat: place["results"][6]["coordinates"]["latitude"], 
    lng: place["results"][6]["coordinates"]["longitude"],
    description: place["results"][6]["snippet"],
    link_url: "https://www.visitportugal.com/en/content/se-catedral-do-porto"
    )
photo_7 = place["results"][6]["images"][0]["source_url"]
file_7 = URI.open(photo_7)
place_7.photo.attach(io: file_7, filename: 'porto.jpg', content_type: 'image/jpg')
place_7.save
puts "finish 26"
# sleep(3)

place_8 = Place.new(
    name: place["results"][7]["name"],
    category: "Museums",
    lat: place["results"][7]["coordinates"]["latitude"], 
    lng: place["results"][7]["coordinates"]["longitude"],
    description: place["results"][7]["snippet"],
    city: "porto",
    link_url: "https://www.portugalvisitor.com/porto-attractions/paco-episcopal"

    )

photo_8 = place["results"][7]["images"][0]["source_url"]
file_8 = URI.open(photo_8)
place_8.photo.attach(io: file_8, filename: 'porto.jpg', content_type: 'image/jpg')
place_8.save
puts "finish 27"
# sleep(3)

place_9 = Place.new(
    name: place["results"][8]["name"],
    category: "Landmarks",
    lat: place["results"][8]["coordinates"]["latitude"], 
    lng: place["results"][8]["coordinates"]["longitude"],
    description: place["results"][8]["snippet"],
    city: "porto",
    link_url: "http://www.pousadapalaciodofreixo.com/pt/"
)

photo_9 = place["results"][8]["images"][0]["source_url"]
file_9 = URI.open(photo_9)
place_9.photo.attach(io: file_9, filename: 'porto.jpg', content_type: 'image/jpg')
place_9.save
puts "finish 28"
# sleep(3)

place_10 = Place.new(
    name: place["results"][9]["name"],
    category: "Museums",
    lat: place["results"][9]["coordinates"]["latitude"], 
    lng: place["results"][9]["coordinates"]["longitude"],
    description: place["results"][9]["snippet"],
    city: "porto",
    link_url: "https://localporto.com/casa-infante-house-of-prince-porto/"
)
photo_10 = place["results"][9]["images"][0]["source_url"]
file_10 = URI.open(photo_10)
place_10.photo.attach(io: file_10, filename: 'porto.jpg', content_type: 'image/jpg')
place_10.save
puts "finish 29"



# COIMBRA # 

url_coimbra = 'https://www.triposo.com/api/20201111/poi.json?location_id=Coimbra&count=20&fields=images,name,coordinates,snippet&account=C5KPFAI5&token=1cqamu68ut4x8he5cmoglzkjmkyddw1n'
place_serialized = open(url_coimbra).read
place = JSON.parse(place_serialized)

puts "Creating places"
place_1 = Place.new(
    name: place["results"][0]["name"],
    category: "Museums",
    lat: place["results"][0]["coordinates"]["latitude"],
    lng: place["results"][0]["coordinates"]["longitude"],
    description: place["results"][0]["snippet"],
    city: "coimbra",
    link_url: "http://www.museumachadocastro.gov.pt/en-GB/default.aspx"
    )
photo = place["results"][0]["images"][0]["source_url"]
file = URI.open(photo)
place_1.photo.attach(io: file, filename: 'coimbra.jpg', content_type: 'image/jpg')
place_1.save
# puts "finish 30"
# sleep(3)


place_2 = Place.new(
    name: place["results"][1]["name"],
    category: "Landmarks",
    lat: place["results"][1]["coordinates"]["latitude"], 
    lng: place["results"][1]["coordinates"]["longitude"],
    description: place["results"][1]["snippet"],
    city: "coimbra",
    link_url: "https://en.wikipedia.org/wiki/Portugal_dos_Pequenitos"
)
photo_2 = place["results"][1]["images"][0]["source_url"]
file_2 = URI.open(photo_2)
place_2.photo.attach(io: file_2, filename: 'coimbra.jpg', content_type: 'image/jpg')
place_2.save
puts "finish 32"
# sleep(3)

place_3 = Place.new(
    name: place["results"][2]["name"],
    category: "Landmarks",
    lat: place["results"][2]["coordinates"]["latitude"], 
    lng: place["results"][2]["coordinates"]["longitude"],
    description: place["results"][2]["snippet"],
    city: "coimbra",
    link_url: "https://www.quintadaslagrimas.pt/en/"
)
photo_3 = place["results"][2]["images"][0]["source_url"]
file_3 = URI.open(photo_3)
place_3.photo.attach(io: file_3, filename: 'coimbra.jpg', content_type: 'image/jpg')
place_3.save
puts "finish 33"
# sleep(3)

place_4 = Place.new(
    name: place["results"][3]["name"],
    category: "Activities",
    lat: place["results"][3]["coordinates"]["latitude"], 
    lng: place["results"][3]["coordinates"]["longitude"],
    description: place["results"][3]["snippet"],
    city: "coimbra",
    link_url: "https://www.quintadaslagrimas.pt/en/"
)

photo_4 = place["results"][3]["images"][0]["source_url"]
file_4 = URI.open(photo_4)
place_4.photo.attach(io: file_4, filename: 'coimbra.jpg', content_type: 'image/jpg')
place_4.save
puts "finish 34"
# sleep(3)


place_5 = Place.new(
    name: place["results"][4]["name"],
    category: "Landmarks",
    lat: place["results"][4]["coordinates"]["latitude"], 
    lng: place["results"][4]["coordinates"]["longitude"],
    description: place["results"][4]["snippet"],
    city: "coimbra",
    link_url: "https://www.culturacentro.gov.pt/mosteiro-santa-clara-a-velha-en/"
)

photo_5 = place["results"][4]["images"][0]["source_url"]
file_5 = URI.open(photo_5)
place_5.photo.attach(io: file_5, filename: 'coimbra.jpg', content_type: 'image/jpg')
place_5.save
puts "finish 35"
# sleep(3)

place_6 = Place.new(
    name: place["results"][5]["name"],
    category: "Landmarks",
    lat: place["results"][5]["coordinates"]["latitude"], 
    lng: place["results"][5]["coordinates"]["longitude"],
    description: place["results"][5]["snippet"],
    city: "coimbra",
    link_url: "https://www.coimbraportugaltourism.com/guide/se-velha-old-cathedral.html"
)

photo_6 = place["results"][5]["images"][0]["source_url"]
file_6 = URI.open(photo_6)
place_6.photo.attach(io: file_6, filename: 'coimbra.jpg', content_type: 'image/jpg')
place_6.save
puts "finish 36"
# sleep(3)

place_7 = Place.new(
    name: place["results"][6]["name"],
    category: "Activities",
    lat: place["results"][6]["coordinates"]["latitude"], 
    lng: place["results"][6]["coordinates"]["longitude"],
    description: place["results"][6]["snippet"],
    city: "coimbra",
    link_url: "https://www.publicspace.org/works/-/project/f234-parque-verde-do-mondego"
)

photo_7 = place["results"][6]["images"][0]["source_url"]
file_7 = URI.open(photo_7)
place_7.photo.attach(io: file_7, filename: 'coimbra.jpg', content_type: 'image/jpg')
place_7.save
puts "finish 37"
# sleep(3)

place_8 = Place.new(
    name: place["results"][7]["name"],
    category: "Landmarks",
    lat: place["results"][7]["coordinates"]["latitude"], 
    lng: place["results"][7]["coordinates"]["longitude"],
    description: place["results"][7]["snippet"],
    city: "coimbra",
    link_url: "https://www.coimbraportugaltourism.com/guide/mosteiro-de-santa-cruz.html"
)

photo_8 = place["results"][7]["images"][0]["source_url"]
file_8 = URI.open(photo_8)
place_8.photo.attach(io: file_8, filename: 'coimbra.jpg', content_type: 'image/jpg')
place_8.save
puts "finish 38"
# sleep(3)

place_9 = Place.new(
    name: place["results"][8]["name"],
    category: "Activities",
    lat: place["results"][8]["coordinates"]["latitude"], 
    lng: place["results"][8]["coordinates"]["longitude"],
    description: place["results"][8]["snippet"],
    city: "coimbra",
    link_url: "https://www.uc.pt/en/jardimbotanico"
)

photo_9 = place["results"][8]["images"][0]["source_url"]
file_9 = URI.open(photo_9)
place_9.photo.attach(io: file_9, filename: 'coimbra.jpg', content_type: 'image/jpg')
place_9.save
puts "finish 39"
# sleep(3)

place_10 = Place.new(
    name: place["results"][9]["name"],
    category: "Museums",
    lat: place["results"][9]["coordinates"]["latitude"], 
    lng: place["results"][9]["coordinates"]["longitude"],
    description: place["results"][9]["snippet"],
    city: "coimbra",
    link_url: "https://www.coimbraportugaltourism.com/guide/mosteiro-de-santa-clara-a-nova.html"
)

photo_10 = place["results"][9]["images"][0]["source_url"]
file_10 = URI.open(photo_10)
place_10.photo.attach(io: file_10, filename: 'coimbra.jpg', content_type: 'image/jpg')
place_10.save
puts "finish 40"

place_11 = Place.new(
    name: place["results"][10]["name"],
    category: "Museums",
    lat: place["results"][10]["coordinates"]["latitude"], 
    lng: place["results"][10]["coordinates"]["longitude"],
    description: place["results"][10]["snippet"],
    city: "coimbra",
    link_url: "https://www.coimbraportugaltourism.com/guide/se-nova-new-cathedral.html"
)

photo_11 = place["results"][10]["images"][0]["source_url"]
file_11 = URI.open(photo_11)
place_11.photo.attach(io: file_11, filename: 'coimbra.jpg', content_type: 'image/jpg')
place_11.save
puts "finish 41"


place_12 = Place.new(
    name: place["results"][11]["name"],
    category: "Museums",
    lat: place["results"][11]["coordinates"]["latitude"], 
    lng: place["results"][11]["coordinates"]["longitude"],
    description: place["results"][11]["snippet"],
    city: "coimbra",
    link_url: "https://en.wikipedia.org/wiki/Pedro_e_In%C3%AAs_bridge"
)

photo_12 = place["results"][11]["images"][0]["source_url"]
file_12 = URI.open(photo_12)
place_12.photo.attach(io: file_12, filename: 'coimbra.jpg', content_type: 'image/jpg')
place_12.save
puts "finish 42"

place_13 = Place.new(
    name: place["results"][12]["name"],
    category: "Activities",
    lat: place["results"][12]["coordinates"]["latitude"], 
    lng: place["results"][12]["coordinates"]["longitude"],
    description: place["results"][12]["snippet"],
    city: "coimbra",
    link_url: "https://en.wikipedia.org/wiki/Choupal_National_Forest"
)

photo_13 = place["results"][12]["images"][0]["source_url"]
file_13 = URI.open(photo_13)
place_13.photo.attach(io: file_13, filename: 'coimbra.jpg', content_type: 'image/jpg')
place_13.save
puts "finish 43"


place_14 = Place.new(
    name: place["results"][13]["name"],
    category: "Activities",
    lat: place["results"][13]["coordinates"]["latitude"], 
    lng: place["results"][13]["coordinates"]["longitude"],
    description: place["results"][13]["snippet"],
    link_url: "https://www.penedodasaudade.pt/"
    )
photo_14 = place["results"][13]["images"][0]["source_url"]
file_14 = URI.open(photo_14)
place_14.photo.attach(io: file_14, filename: 'coimbra.jpg', content_type: 'image/jpg')
place_14.save
# puts "finish 14"


place_15 = Place.new(
    name: place["results"][14]["name"],
    category: "Landmarks",
    lat: place["results"][14]["coordinates"]["latitude"], 
    lng: place["results"][14]["coordinates"]["longitude"],
    description: place["results"][14]["snippet"],
    city: "coimbra",
    link_url: "https://en.wikipedia.org/wiki/Igreja_de_Santiago_(Coimbra)"
)

photo_15 = place["results"][14]["images"][0]["source_url"]
file_15 = URI.open(photo_15)
place_15.photo.attach(io: file_15, filename: 'coimbra.jpg', content_type: 'image/jpg')
place_15.save

# puts "finish 15"

# NAZARE' # 

url_nazare = 'https://www.triposo.com/api/20201111/poi.json?location_id=NazarC3A92C_Portugal&count=20&fields=images,name,coordinates,snippet&account=C5KPFAI5&token=1cqamu68ut4x8he5cmoglzkjmkyddw1n'
place_serialized = open(url_nazare).read
place = JSON.parse(place_serialized)

puts "Creating places"
place_1 = Place.new(
    name: place["results"][0]["name"],
    category: "Landmarks",
    lat: place["results"][0]["coordinates"]["latitude"],
    lng: place["results"][0]["coordinates"]["longitude"],
    description: place["results"][0]["snippet"],
    link_url: "https://en.wikipedia.org/wiki/Memory_Hermitage_of_Nazar%C3%A9"
    )
photo = place["results"][0]["images"][0]["source_url"]
file = URI.open(photo)
place_1.photo.attach(io: file, filename: 'nazare.jpg', content_type: 'image/jpg')
place_1.save
# puts "finish 1"
# sleep(3)


place_2 = Place.new(
    name: place["results"][1]["name"],
    category: "Landmarks",
    lat: place["results"][1]["coordinates"]["latitude"], 
    lng: place["results"][1]["coordinates"]["longitude"],
    description: place["results"][1]["snippet"],
    link_url: "https://www.nazareportugaltourism.com/guide/santuario-de-nossa-senhora-da-nazare.html"
    )
photo_2 = place["results"][1]["images"][0]["source_url"]
file_2 = URI.open(photo_2)
place_2.photo.attach(io: file_2, filename: 'nazare.jpg', content_type: 'image/jpg')
place_2.save
# puts "finish 2"
# sleep(3)

place_3 = Place.new(
    name: place["results"][2]["name"],
    category: "Landmarks",
    lat: place["results"][2]["coordinates"]["latitude"], 
    lng: place["results"][2]["coordinates"]["longitude"],
    description: place["results"][2]["snippet"],
    link_url: "https://en.m.wikipedia.org/wiki/Fort_of_S%C3%A3o_Miguel_Arcanjo"
    )
photo_3 = place["results"][2]["images"][0]["source_url"]
file_3 = URI.open(photo_3)
place_3.photo.attach(io: file_3, filename: 'nazare.jpg', content_type: 'image/jpg')
place_3.save
# puts "finish 3"
# sleep(3)

place_4 = Place.new(
    name: place["results"][3]["name"],
    category: "Landmarks",
    lat: place["results"][3]["coordinates"]["latitude"], 
    lng: place["results"][3]["coordinates"]["longitude"],
    description: place["results"][3]["snippet"],
    link_url: "https://www.portugaltravel.org/igreja-da-misericordia-church-nazare"
    )
photo_4 = place["results"][3]["images"][0]["source_url"]
file_4 = URI.open(photo_4)
place_4.photo.attach(io: file_4, filename: 'nazare.jpg', content_type: 'image/jpg')
place_4.save
# puts "finish 4"
# sleep(3)


place_5 = Place.new(
    name: place["results"][4]["name"],
    category: "Museums",
    lat: place["results"][4]["coordinates"]["latitude"], 
    lng: place["results"][4]["coordinates"]["longitude"],
    description: place["results"][4]["snippet"],
    link_url: "https://www.portugaltravel.org/museums-in-nazare"
    )
photo_5 = place["results"][4]["images"][0]["source_url"]
file_5 = URI.open(photo_5)
place_5.photo.attach(io: file_5, filename: 'nazare.jpg', content_type: 'image/jpg')
place_5.save
# puts "finish 5"
# sleep(3)

place_6 = Place.new(
    name: place["results"][5]["name"],
    category: "Museums",
    lat: place["results"][5]["coordinates"]["latitude"], 
    lng: place["results"][5]["coordinates"]["longitude"],
    description: place["results"][5]["snippet"],
    link_url: "http://www.patrimoniocultural.gov.pt/pt/museus-e-monumentos/rede-portuguesa/m/museu-dr-joaquim-manso/"
    )
photo_6 = place["results"][5]["images"][0]["source_url"]
file_6 = URI.open(photo_6)
place_6.photo.attach(io: file_6, filename: 'nazare.jpg', content_type: 'image/jpg')
place_6.save
# puts "finish 6"
# sleep(3)

place_7 = Place.new(
    name: place["results"][6]["name"],
    category: "Activities",
    lat: place["results"][6]["coordinates"]["latitude"], 
    lng: place["results"][6]["coordinates"]["longitude"],
    description: place["results"][6]["snippet"],
    link_url: "hhttp://blablanazare.com/"
    )
photo_7 = place["results"][6]["images"][0]["source_url"]
file_7 = URI.open(photo_7)
place_7.photo.attach(io: file_7, filename: 'nazare.jpg', content_type: 'image/jpg')
place_7.save
# puts "finish 7"
# sleep(3)

place_8 = Place.new(
    name: place["results"][7]["name"],
    category: "Activities",
    lat: place["results"][7]["coordinates"]["latitude"], 
    lng: place["results"][7]["coordinates"]["longitude"],
    description: place["results"][7]["snippet"],
    link_url: "https://www.tripadvisor.in/Attraction_Review-g315902-d8769974-Reviews-Nazaret_Artesanato_e_design_de_Autor-Nazare_Leiria_District_Central_Portugal.html"
    )
photo_8 = place["results"][7]["images"][0]["source_url"]
file_8 = URI.open(photo_8)
place_8.photo.attach(io: file_8, filename: 'nazare.jpg', content_type: 'image/jpg')
place_8.save
# puts "finish 8"
# sleep(3)

place_9 = Place.new(
    name: place["results"][8]["name"],
    category: "Activities",
    lat: place["results"][8]["coordinates"]["latitude"], 
    lng: place["results"][8]["coordinates"]["longitude"],
    description: place["results"][8]["snippet"],
    link_url: "http://www.cm-nazare.pt/pt/mercado-municipal-da-nazare-360"
    )
photo_9 = place["results"][8]["images"][0]["source_url"]
file_9 = URI.open(photo_9)
place_9.photo.attach(io: file_9, filename: 'nazare.jpg', content_type: 'image/jpg')
place_9.save
# puts "finish 9"
# sleep(3)

# Skip place 10-11-12 because irrelevant #

place_13 = Place.new(
    name: place["results"][12]["name"],
    category: "Museums",
    lat: place["results"][12]["coordinates"]["latitude"], 
    lng: place["results"][12]["coordinates"]["longitude"],
    description: place["results"][12]["snippet"],
    link_url: "https://www.coimbraportugaltourism.com/guide/mosteiro-de-santa-clara-a-nova.html"
    )
photo_13 = place["results"][12]["images"][0]["source_url"]
file_13 = URI.open(photo_13)
place_13.photo.attach(io: file_13, filename: 'nazare.jpg', content_type: 'image/jpg')
place_13.save
# puts "finish 10"



puts "finish 45"



# EVORA #


url_evora = 'https://www.triposo.com/api/20201111/poi.json?location_id=C389vora&count=20&fields=images,name,coordinates,snippet&account=C5KPFAI5&token=1cqamu68ut4x8he5cmoglzkjmkyddw1n'
place_serialized = open(url_evora).read
place = JSON.parse(place_serialized)

puts "Creating places"
place_1 = Place.new(
    name: place["results"][0]["name"],
    category: "Landmarks",
    lat: place["results"][0]["coordinates"]["latitude"],
    lng: place["results"][0]["coordinates"]["longitude"],
    description: place["results"][0]["snippet"],
    city: "evora",
    link_url: "https://www.visitevora.net/en/roman-temple-evora/"
    )
photo = place["results"][0]["images"][0]["source_url"]
file = URI.open(photo)
place_1.photo.attach(io: file, filename: 'evora.jpg', content_type: 'image/jpg')
place_1.save

# puts "finish 1"
# sleep(3)


place_2 = Place.new(
    name: place["results"][1]["name"],
    category: "Museums",
    lat: place["results"][1]["coordinates"]["latitude"], 
    lng: place["results"][1]["coordinates"]["longitude"],
    description: place["results"][1]["snippet"],
    link_url: "http://www.evoracathedral.com/?lang=en"
    )
file_2 = URI.open(photo_2)
place_2.photo.attach(io: file_2, filename: 'evora.jpg', content_type: 'image/jpg')
place_2.save
# puts "finish 2"

puts "finish 56"

# sleep(3)

place_3 = Place.new(
    name: place["results"][2]["name"],
    category: "Museums",
    lat: place["results"][2]["coordinates"]["latitude"], 
    lng: place["results"][2]["coordinates"]["longitude"],
    description: place["results"][2]["snippet"],
    city: "evora",
    link_url: "https://en.wikipedia.org/wiki/Capela_dos_Ossos"
)

photo_3 = place["results"][2]["images"][0]["source_url"]
file_3 = URI.open(photo_3)
place_3.photo.attach(io: file_3, filename: 'evora.jpg', content_type: 'image/jpg')
place_3.save
puts "finish 58"
# sleep(3)

place_4 = Place.new(
    name: place["results"][3]["name"],
    category: "Activities",
    lat: place["results"][3]["coordinates"]["latitude"], 
    lng: place["results"][3]["coordinates"]["longitude"],
    description: place["results"][3]["snippet"],
    city: "evora",
    link_url: "https://www.visitevora.net/en/almendres-cromlech-portugal/"

)

photo_4 = place["results"][3]["images"][0]["source_url"]
file_4 = URI.open(photo_4)
place_4.photo.attach(io: file_4, filename: 'evora.jpg', content_type: 'image/jpg')
place_4.save
puts "finish 59"
# sleep(3)


place_5 = Place.new(
    name: place["results"][4]["name"],
    category: "Museums",
    lat: place["results"][4]["coordinates"]["latitude"], 
    lng: place["results"][4]["coordinates"]["longitude"],
    description: place["results"][4]["snippet"],
    city: "evora",
    link_url: "https://www.visitevora.net/en/king-manuel-palace-evora/"

)

photo_5 = place["results"][4]["images"][0]["source_url"]
file_5 = URI.open(photo_5)
place_5.photo.attach(io: file_5, filename: 'evora.jpg', content_type: 'image/jpg')
place_5.save

# puts "finish 5"
# sleep(3)

place_6 = Place.new(
    name: place["results"][5]["name"],
    category: "Museums",
    lat: place["results"][5]["coordinates"]["latitude"], 
    lng: place["results"][5]["coordinates"]["longitude"],
    description: place["results"][5]["snippet"],
    link_url: "https://www.palaciocadaval.com/"
    )
photo_6 = place["results"][5]["images"][0]["source_url"]
file_6 = URI.open(photo_6)
place_6.photo.attach(io: file_6, filename: 'evora.jpg', content_type: 'image/jpg')
place_6.save
# puts "finish 6"
puts "finish 60"

# sleep(3)

place_7 = Place.new(
    name: place["results"][6]["name"],
    category: "Landmarks",
    lat: place["results"][6]["coordinates"]["latitude"], 
    lng: place["results"][6]["coordinates"]["longitude"],
    description: place["results"][6]["snippet"],
    city: "evora",
    link_url: "https://en.wikipedia.org/wiki/Church_of_Nossa_Senhora_da_Gra%C3%A7a_(%C3%89vora)"
)

photo_7 = place["results"][6]["images"][0]["source_url"]
file_7 = URI.open(photo_7)
place_7.photo.attach(io: file_7, filename: 'evora.jpg', content_type: 'image/jpg')
place_7.save
puts "finish 62"
# sleep(3)

place_8 = Place.new(
    name: place["results"][7]["name"],
    category: "Landmarks",
    lat: place["results"][7]["coordinates"]["latitude"], 
    lng: place["results"][7]["coordinates"]["longitude"],
    description: place["results"][7]["snippet"],
    city: "evora",
    link_url: "https://www.visitevora.net/igreja-espirito-santo-evora/"
)

photo_8 = place["results"][7]["images"][0]["source_url"]
file_8 = URI.open(photo_8)
place_8.photo.attach(io: file_8, filename: 'evora.jpg', content_type: 'image/jpg')
place_8.save
puts "finish 63"
# sleep(3)


# Skip place 9 because irrelevant ~

place_10 = Place.new(
    name: place["results"][9]["name"],
    category: "Landmarks",
    lat: place["results"][9]["coordinates"]["latitude"], 
    lng: place["results"][9]["coordinates"]["longitude"],
    description: place["results"][9]["snippet"],
    link_url: "https://en.wikipedia.org/wiki/Church_of_the_L%C3%B3ios"
    )
photo_10 = place["results"][9]["images"][0]["source_url"]
file_10 = URI.open(photo_10)
place_10.photo.attach(io: file_10, filename: 'evora.jpg', content_type: 'image/jpg')
place_10.save
# puts "finish 9"
# sleep(3)



# ALGARVE #

url_algarve = 'https://www.triposo.com/api/20201111/poi.json?location_id=wv__Algarve&count=20&fields=images,name,coordinates,snippet&account=C5KPFAI5&token=1cqamu68ut4x8he5cmoglzkjmkyddw1n'
place_serialized = open(url_algarve).read
place = JSON.parse(place_serialized)

puts "Creating places"
place_1 = Place.new(
    name: place["results"][0]["name"],
    category: "Landmarks",
    lat: place["results"][0]["coordinates"]["latitude"],
    lng: place["results"][0]["coordinates"]["longitude"],
    description: place["results"][0]["snippet"],
    city: "algarve",
    link_url: "https://en.wikipedia.org/wiki/Lighthouse_of_Cabo_de_S%C3%A3o_Vicente"
    )
photo = place["results"][0]["images"][0]["source_url"]
file = URI.open(photo)
place_1.photo.attach(io: file, filename: 'algarve.jpg', content_type: 'image/jpg')
place_1.save
puts "finish 65"
# sleep(3)


place_2 = Place.new(
    name: place["results"][1]["name"],
    category: "Landmarks",
    lat: place["results"][1]["coordinates"]["latitude"], 
    lng: place["results"][1]["coordinates"]["longitude"],
    description: place["results"][1]["snippet"],
    city: "algarve",
    link_url: "https://en.wikipedia.org/wiki/Castle_of_Castro_Marim"

)
photo_2 = place["results"][1]["images"][0]["source_url"]

file_2 = URI.open(photo_2)
place_2.photo.attach(io: file_2, filename: 'algarve.jpg', content_type: 'image/jpg')
place_2.save
puts "finish 66"
# sleep(3)

place_3 = Place.new(
    name: place["results"][2]["name"],
    category: "Museums",
    lat: place["results"][2]["coordinates"]["latitude"], 
    lng: place["results"][2]["coordinates"]["longitude"],
    description: place["results"][2]["snippet"],
    city: "algarve",
    link_url: "https://www.visitportugal.com/en/node/135682"
)

photo_3 = place["results"][2]["images"][0]["source_url"]
file_3 = URI.open(photo_3)
place_3.photo.attach(io: file_3, filename: 'algarve.jpg', content_type: 'image/jpg')
place_3.save
puts "finish 67"
# sleep(3)

place_4 = Place.new(
    name: place["results"][3]["name"],
    category: "Landmarks",
    lat: place["results"][3]["coordinates"]["latitude"], 
    lng: place["results"][3]["coordinates"]["longitude"],
    description: place["results"][3]["snippet"],
    city: "algarve",
    link_url: "https://en.wikipedia.org/wiki/Silves_Cathedral"
)

photo_4 = place["results"][3]["images"][0]["source_url"]
file_4 = URI.open(photo_4)
place_4.photo.attach(io: file_4, filename: 'algarve.jpg', content_type: 'image/jpg')
place_4.save
puts "finish 68"
# sleep(3)


place_5 = Place.new(
    name: place["results"][4]["name"],
    category: "Landmarks",
    lat: place["results"][4]["coordinates"]["latitude"], 
    lng: place["results"][4]["coordinates"]["longitude"],
    description: place["results"][4]["snippet"],
    city: "algarve",
    link_url: "https://en.wikipedia.org/wiki/Ponta_da_Piedade_Lighthouse"
)

photo_5 = place["results"][4]["images"][0]["source_url"]
file_5 = URI.open(photo_5)
place_5.photo.attach(io: file_5, filename: 'algarve.jpg', content_type: 'image/jpg')
place_5.save
puts "finish 69"
# sleep(3)

# place 6 skipped because irrelevant #

place_7 = Place.new(
    name: place["results"][6]["name"],
    category: "Landmarks",
    lat: place["results"][6]["coordinates"]["latitude"], 
    lng: place["results"][6]["coordinates"]["longitude"],
    description: place["results"][6]["snippet"],
    city: "algarve",
    link_url: "https://en.wikipedia.org/wiki/Fort_of_Ponta_da_Bandeira"
)

photo_7 = place["results"][6]["images"][0]["source_url"]
file_7 = URI.open(photo_7)
place_7.photo.attach(io: file_7, filename: 'algarve.jpg', content_type: 'image/jpg')
place_7.save
puts "finish 70"
# sleep(3)

place_8 = Place.new(
    name: place["results"][7]["name"],
    category: "Landmarks",
    lat: place["results"][7]["coordinates"]["latitude"], 
    lng: place["results"][7]["coordinates"]["longitude"],
    description: place["results"][7]["snippet"],
    city: "algarve",
    link_url: "https://www.algarvetips.com/cities/faro/cathedral-of-faro/"
)

photo_8 = place["results"][7]["images"][0]["source_url"]
file_8 = URI.open(photo_8)
place_8.photo.attach(io: file_8, filename: 'algarve.jpg', content_type: 'image/jpg')
place_8.save
puts "finish 71"
# sleep(3)

place_9 = Place.new(
    name: place["results"][8]["name"],
    category: "Landmarks",
    lat: place["results"][8]["coordinates"]["latitude"], 
    lng: place["results"][8]["coordinates"]["longitude"],
    description: place["results"][8]["snippet"],
    city: "algarve",
    link_url: "https://en.wikipedia.org/wiki/Lighthouse_of_Ponta_de_Sagres"
)

photo_9 = place["results"][8]["images"][0]["source_url"]
file_9 = URI.open(photo_9)
place_9.photo.attach(io: file_9, filename: 'algarve.jpg', content_type: 'image/jpg')
place_9.save
puts "finish 72"
# sleep(3)

place_10 = Place.new(
    name: place["results"][9]["name"],
    category: "Activities",
    lat: place["results"][9]["coordinates"]["latitude"], 
    lng: place["results"][9]["coordinates"]["longitude"],
    description: place["results"][9]["snippet"],
    city: "algarve",
    link_url: "https://en.wikipedia.org/wiki/Pego_do_Inferno"
)

photo_10 = place["results"][9]["images"][0]["source_url"]
file_10 = URI.open(photo_10)
place_10.photo.attach(io: file_10, filename: 'algarve.jpg', content_type: 'image/jpg')
place_10.save
puts "finish 73"
# sleep(3)
puts "should be 104 places after all of this"
ending = Time.now

place_11 = Place.new(
    name: place["results"][10]["name"],
    category: "Landmarks",
    lat: place["results"][10]["coordinates"]["latitude"], 
    lng: place["results"][10]["coordinates"]["longitude"],
    description: place["results"][10]["snippet"],
    link_url: "https://en.wikipedia.org/wiki/Fort_of_Santo_Ant%C3%B3nio_de_Belixe"
    )
photo_11 = place["results"][10]["images"][0]["source_url"]
file_11 = URI.open(photo_11)
place_11.photo.attach(io: file_11, filename: 'algarve.jpg', content_type: 'image/jpg')
place_11.save
# puts "finish 11"
# sleep(3)

place_12 = Place.new(
    name: place["results"][11]["name"],
    category: "Landmarks",
    lat: place["results"][11]["coordinates"]["latitude"], 
    lng: place["results"][11]["coordinates"]["longitude"],
    description: place["results"][11]["snippet"],
    link_url: "https://en.wikipedia.org/wiki/Fort_of_Nossa_Senhora_da_Rocha_(Porches)"
    )
photo_12 = place["results"][11]["images"][0]["source_url"]
file_12 = URI.open(photo_12)
place_12.photo.attach(io: file_12, filename: 'algarve.jpg', content_type: 'image/jpg')
place_12.save
# puts "finish 12"
# sleep(3)


place_13 = Place.new(
    name: place["results"][12]["name"],
    category: "Landmarks",
    lat: place["results"][12]["coordinates"]["latitude"], 
    lng: place["results"][12]["coordinates"]["longitude"],
    description: place["results"][12]["snippet"],
    link_url: "https://www.walkalgarve.com/attractions-and-things-to-do-in-algarve/castle-of-paderne"
    )
photo_13 = place["results"][12]["images"][0]["source_url"]
file_13 = URI.open(photo_13)
place_13.photo.attach(io: file_13, filename: 'algarve.jpg', content_type: 'image/jpg')
place_13.save
# puts "finish 13"
# sleep(3)


place_14 = Place.new(
    name: place["results"][13]["name"],
    category: "Landmarks",
    lat: place["results"][13]["coordinates"]["latitude"], 
    lng: place["results"][13]["coordinates"]["longitude"],
    description: place["results"][13]["snippet"],
    link_url: "https://en.wikipedia.org/wiki/Guadiana_International_Bridge"
    )
photo_14 = place["results"][13]["images"][0]["source_url"]
file_14 = URI.open(photo_14)
place_14.photo.attach(io: file_14, filename: 'algarve.jpg', content_type: 'image/jpg')
place_14.save
# puts "finish 10"
# sleep(3)

puts "Finished the seed in #{(ending - start).round(2)} seconds."

