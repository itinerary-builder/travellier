# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating 10 places...'

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
