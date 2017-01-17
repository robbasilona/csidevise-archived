# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pin = Pin.create(name: "Puregold Jr", classification: "Grocery", latitude: "14.645622", longitude: "121.053441")
pin = Pin.create(name: "Mercury Drug", classification: "Drugstore", latitude: "14.645578", longitude: "121.052709")

supply = Supply.create(name: "Sardines", category: "Food")
supply = Supply.create(name: "Bread", category: "Food")
supply = Supply.create(name: "Paracetamol", category: "Medicine")

Pin.find(1).supplies << Supply.find(1)
Pin.find(1).supplies << Supply.find(2)
Pin.find(2).supplies << Supply.find(2)
Pin.find(2).supplies << Supply.find(3)

Stock.find(1).update_attributes(quantity: "100")