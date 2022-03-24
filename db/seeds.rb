# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Car.destroy_all
Maker.destroy_all

dodge = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)
bmw = Maker.create!(name: "BMW", domestic: false, year_founded: 1916)
toyota = Maker.create!(name: "Toyota", domestic: false, year_founded: 1937)
ford = Maker.create!(name: "Ford", domestic: true, year_founded: 1896)
hyundai = Maker.create!(name: "Hyundai", domestic: true, year_founded: 1967)

dodge.cars.create!(name: "Durango", color: "black", doors: 4, in_production: true)
dodge.cars.create!(name: "Neon", color: "white", doors: 4, in_production: true)
dodge.cars.create!(name: "Aries", color: "beige", doors: 2, in_production: false)

bmw.cars.create!(name: "X5", color: "blue", doors: 4, in_production: true)
bmw.cars.create!(name: "iX", color: "black", doors: 4, in_production: true)
bmw.cars.create!(name: "Z1", color: "red", doors: 2, in_production: false)

toyota.cars.create!(name: "Camry", color: "grey", doors: 4, in_production: true)
toyota.cars.create!(name: "Fortuner", color: "silver", doors: 4, in_production: true)
toyota.cars.create!(name: "Bandeirante", color: "tan", doors: 2, in_production: false)

ford.cars.create!(name: "Taurus", color: "white", doors: 4, in_production: true)
ford.cars.create!(name: "Ranger", color: "orange", doors: 2, in_production: true)
ford.cars.create!(name: "Aerostar", color: "white", doors: 3, in_production: false)

hyundai.cars.create!(name: "Accent", color: "red", doors: 4, in_production: true)
hyundai.cars.create!(name: "Elantra", color: "white", doors: 4, in_production: true)
hyundai.cars.create!(name: "Genesis", color: "purple", doors: 4, in_production: false)
