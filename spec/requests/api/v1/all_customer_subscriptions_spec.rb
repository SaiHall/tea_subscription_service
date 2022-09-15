require 'rails_helper'

RSpec.describe 'All customer subscriptions endpoint' do
  before(:each) do
    @customer1 = Customer.create!(first_name: "Jimbob", last_name: "Dudeguy", email: "ItsJim@TheDude.org", address: "555 Living st, Location FL, 33590")
    @customer2 = Customer.create!(first_name: "Ivanna", last_name: "Pepsi", email: "justone@pepsi.pls", address: "789 Cola lane, Carbonation FL, 33585")

    tea1 = Tea.create!(title: "White Jade", description: "A light, slightly fruity white tea.", brew_time: 3, temperature: 195.6)
    tea2 = Tea.create!(title: "Lady Grey", description: "All the benefits of Earl Grey, with a little citrus.", brew_time: 7, temperature: 200.0)

    @sub1 = Subscription.create!(title: "White Tea Addict", frequency: 0, price: 1499, tea_id: tea1.id )
    @sub2 = Subscription.create!(title: "Grey Connoisseur", frequency: 1, price: 2499, tea_id: tea2.id)
    @active_sub1 = CustomerSubscription.create!({ customer_id: @customer1.id, subscription_id: @sub2.id })
    @active_sub1 = CustomerSubscription.create!({ customer_id: @customer1.id, subscription_id: @sub1.id, status: 1 })
  end

  it 'can get a successful response' do
    headers = { "CONTENT_TYPE" => "application/json" }

    get "/api/v1/customers/#{@customer1.id}/subscriptions", headers: headers
    expect(response).to be_successful
    expect(response.status).to eq(200)
  end

  it 'will return all subscriptions that user has or had' do
    headers = { "CONTENT_TYPE" => "application/json" }

    get "/api/v1/customers/#{@customer1.id}/subscriptions", headers: headers

    response_body = JSON.parse(response.body, symbolize_names: true)
    index_return = response_body[:data]

    expect(index_return).to be_a(Hash)
    expect(index_return.keys).to eq([:customer, :subscriptions])
    expect(index_return[:customer]).to be_a(String)
    expect(index_return[:subscriptions]).to be_an(Array)
    expect(index_return[:subscriptions].length).to eq(2)


    index_return[:subscriptions].each do |sub_return|
      expect(sub_return).to be_a(Hash)
      expect(sub_return.keys).to eq([:tea, :subscription, :frequency, :cost, :status])
      expect(sub_return[:tea]).to be_a(String)
      expect(sub_return[:subscription]).to be_a(String)
      expect(sub_return[:cost]).to be_a(Float)
      expect(sub_return[:frequency]).to be_a(String)
      expect(sub_return[:status]).to be_a(String)
    end
  end
end
