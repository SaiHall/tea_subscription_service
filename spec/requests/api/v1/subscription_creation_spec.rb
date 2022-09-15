require 'rails_helper'

RSpec.describe 'Subscription creation endpoint' do
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
    sub_params = { subscription_id: @sub1.id }

    post "/api/v1/customers/#{@customer1.id}/subscriptions", headers: headers, params: JSON.generate(sub_params)
    expect(response).to be_successful
    expect(response.status).to eq(200)
  end

  it 'can return information about the user and their new subscription' do
    headers = { "CONTENT_TYPE" => "application/json" }
    sub_params = { subscription_id: @sub1.id }

    post "/api/v1/customers/#{@customer1.id}/subscriptions", headers: headers, params: JSON.generate(sub_params)

    response_body = JSON.parse(response.body, symbolize_names: true)
    new_sub_return = response_body[:data]

    expect(new_sub_return).to be_a(Hash)
    expect(new_sub_return.keys).to eq([:customer, :tea, :frequency, :cost, :status])
    expect(new_sub_return[:customer]).to be_a(String)
    expect(new_sub_return[:tea]).to be_a(String)
    expect(new_sub_return[:frequency]).to be_a(String)
    expect(new_sub_return[:cost]).to be_a(Float)
    expect(new_sub_return[:status]).to be_a(String)

    expect(new_sub_return[:customer]).to eq("Jimbob Dudeguy")
    expect(new_sub_return[:tea]).to eq("White Jade")
    expect(new_sub_return[:frequency]).to eq("weekly")
    expect(new_sub_return[:cost]).to eq(14.99)
    expect(new_sub_return[:status]).to eq("active")
  end

  describe 'error handling' do
    it 'will return an appropriate message when customer id is invalid' do
      headers = { "CONTENT_TYPE" => "application/json" }
      sub_params = { subscription_id: @sub1.id }

      post "/api/v1/customers/4/subscriptions", headers: headers, params: JSON.generate(sub_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body,symbolize_names: true)
      expect(response_body[:message]).to eq("Validation failed: Customer must exist")
    end

    it 'will return an appropriate message when subscription id is invalid' do
      headers = { "CONTENT_TYPE" => "application/json" }
      sub_params = { subscription_id: 9999999 }

      post "/api/v1/customers/#{@customer1.id}/subscriptions", headers: headers, params: JSON.generate(sub_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body,symbolize_names: true)
      expect(response_body[:message]).to eq("Validation failed: Subscription must exist")
    end
  end
end
