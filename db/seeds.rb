# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Customer.create!(first_name: "Jimbob", last_name: "Dudeguy", email: "ItsJim@TheDude.org", address: "555 Living st, Location FL, 33590")
Customer.create!(first_name: "Ivanna", last_name: "Pepsi", email: "justone@pepsi.pls", address: "789 Cola lane, Carbonation FL, 33585")
tea1 = Tea.create!(title: "White Jade", description: "A light, slightly fruity white tea.", brew_time: 3, temperature: 195.6)
tea2 = Tea.create!(title: "Lady Grey", description: "All the benefits of Earl Grey, with a little citrus.", brew_time: 7, temperature: 200.0)
Subscription.create!(title: "White Tea Addict", frequency: 0, price: 1499, tea_id: tea1.id )
Subscription.create!(title: "Grey Connoisseur", frequency: 1, price: 2499, tea_id: tea2.id)
