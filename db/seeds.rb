# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Customer.create!(first_name: "Jimbob", last_name: "Dudeguy", email: "ItsJim@TheDude.org", address: "555 Living st, Location FL, 33590")
Customer.create!(first_name: "Ivanna", last_name: "Pepsi", email: "justone@pepsi.pls", address: "789 Cola lane, Carbonation FL, 33585")
Customer.create!(first_name: "Casey", last_name: "Oizaf", email: "Stawp@tinyteapot.skull", address: "1111 Moon st, Stargazing CO, 30941")
Customer.create!(first_name: "Deannah", last_name: "Ekrub", email: "daddy@bersme.up", address: "9000 Taxidermy lane, Wilderness CO, 86753")
tea1 = Tea.create!(title: "White Jade", description: "A light, slightly fruity white tea.", brew_time: 3, temperature: 195.6)
tea2 = Tea.create!(title: "Lady Grey", description: "All the benefits of Earl Grey, with a little citrus.", brew_time: 7, temperature: 200.0)
tea3 = Tea.create!(title: "Longer than Oo", description: "An extremely caffeinated Oolong", brew_time: 10, temperature: 212.9)
tea4 = Tea.create!(title: "Black Death", description: "A black tea so strong we had to ask permission to sell it.", brew_time: 6, temperature: 166.6)
Subscription.create!(title: "White Tea Addict", frequency: 0, price: 1499, tea_id: tea1.id)
Subscription.create!(title: "Grey Connoisseur", frequency: 1, price: 2499, tea_id: tea2.id)
Subscription.create!(title: "Longtime Fan", frequency: 2, price: 4999, tea_id: tea3.id)
Subscription.create!(title: "Yearly Date With Death", frequency: 3, price: 8699, tea_id: tea4.id)
