# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


if PlaceType.all.length == 0
	PlaceType.create([{ name: 'Restaurantes', label_name: "Donde Comer" }, { name: 'Hospedaje y Alojamiento', label_name: "Donde Dormir" }, { name: 'Espacios Culturales', label_name: "Donde ir" }, { name: 'Bares y vida nocturna', label_name: "Donde Disfrutar" }])
end