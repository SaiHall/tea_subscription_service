require 'rails_helper'

RSpec.describe 'Subscription cancelation endpoint' do
  before(:each) do
    @customer1 = Customer.create!(first_name: "Jimbob", last_name: "Dudeguy", email: "ItsJim@TheDude.org", address: "555 Living st, Location FL, 33590")
    @customer2 = Customer.create!(first_name: "Ivanna", last_name: "Pepsi", email: "justone@pepsi.pls", address: "789 Cola lane, Carbonation FL, 33585")

    tea1 = Tea.create!(title: "White Jade", description: "A light, slightly fruity white tea.", brew_time: 3, temperature: 195.6)
    tea2 = Tea.create!(title: "Lady Grey", description: "All the benefits of Earl Grey, with a little citrus.", brew_time: 7, temperature: 200.0)

    @sub1 = Subscription.create!(title: "White Tea Addict", frequency: 0, price: 1499, tea_id: tea1.id )
    @sub2 = Subscription.create!(title: "Grey Connoisseur", frequency: 1, price: 2499, tea_id: tea2.id)
  end

  it 'can get a successful response' do
    headers = { "CONTENT_TYPE" => "application/json" }
    sub_params = { customer_id: @customer1.id, subscription_id: @sub1.id }
    CustomerSubscription.create!(sub_params)

    put "/api/v1/subscriptions", headers: headers, params: JSON.generate(sub_params)
    expect(response).to be_successful
  end
end
