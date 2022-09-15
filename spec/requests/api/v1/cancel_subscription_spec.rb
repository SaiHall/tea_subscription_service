require 'rails_helper'

RSpec.describe 'Subscription cancelation endpoint' do
  before(:each) do
    @customer1 = Customer.create!(first_name: "Jimbob", last_name: "Dudeguy", email: "ItsJim@TheDude.org", address: "555 Living st, Location FL, 33590")
    @customer2 = Customer.create!(first_name: "Ivanna", last_name: "Pepsi", email: "justone@pepsi.pls", address: "789 Cola lane, Carbonation FL, 33585")

    tea1 = Tea.create!(title: "White Jade", description: "A light, slightly fruity white tea.", brew_time: 3, temperature: 195.6)
    tea2 = Tea.create!(title: "Lady Grey", description: "All the benefits of Earl Grey, with a little citrus.", brew_time: 7, temperature: 200.0)

    @sub1 = Subscription.create!(title: "White Tea Addict", frequency: 0, price: 1499, tea_id: tea1.id )
    @sub2 = Subscription.create!(title: "Grey Connoisseur", frequency: 1, price: 2499, tea_id: tea2.id)
    @active_sub = CustomerSubscription.create!({ customer_id: @customer1.id, subscription_id: @sub2.id })
  end

  it 'can get a successful response, and change the status of a CustSub' do
    headers = { "CONTENT_TYPE" => "application/json" }
    cancel_params = { cust_sub: @active_sub.id }

    put "/api/v1/customers/#{@customer1.id}/subscriptions", headers: headers, params: JSON.generate(cancel_params)
    expect(response).to be_successful
    expect(response.status).to eq(200)
    canceled_sub = CustomerSubscription.all

    expect(canceled_sub.length).to eq(1)
    expect(canceled_sub.first.status).to eq("canceled")
  end

  it 'can return information about the user and their updated subscription' do
    headers = { "CONTENT_TYPE" => "application/json" }
    cancel_params = { cust_sub: @active_sub.id }

    put "/api/v1/customers/#{@customer1.id}/subscriptions", headers: headers, params: JSON.generate(cancel_params)

    response_body = JSON.parse(response.body, symbolize_names: true)
    cancel_sub_return = response_body[:data]

    expect(cancel_sub_return).to be_a(Hash)
    expect(cancel_sub_return.keys).to eq([:customer, :tea, :subscription, :frequency, :status])
    expect(cancel_sub_return[:customer]).to be_a(String)
    expect(cancel_sub_return[:tea]).to be_a(String)
    expect(cancel_sub_return[:subscription]).to be_a(String)
    expect(cancel_sub_return[:frequency]).to be_a(String)
    expect(cancel_sub_return[:status]).to be_a(String)

    expect(cancel_sub_return[:customer]).to eq("Jimbob Dudeguy")
    expect(cancel_sub_return[:tea]).to eq("Lady Grey")
    expect(cancel_sub_return[:subscription]).to eq("Grey Connoisseur")
    expect(cancel_sub_return[:frequency]).to eq("monthly")
    expect(cancel_sub_return[:status]).to eq("canceled")
  end
end
