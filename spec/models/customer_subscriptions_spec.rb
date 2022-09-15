require 'rails_helper'

RSpec.describe CustomerSubscription, type: :model do
  describe 'relationships' do
    it { should belong_to(:subscription) }
    it { should belong_to(:customer) }
  end

  describe 'validations' do
    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:subscription_id) }
    it { should define_enum_for(:status).with_values([:active, :canceled]) }
  end

  describe 'instance methods' do
    it 'will pull and format information as expected' do
      customer1 = Customer.create!(first_name: "Jimbob", last_name: "Dudeguy", email: "ItsJim@TheDude.org", address: "555 Living st, Location FL, 33590")

      tea1 = Tea.create!(title: "White Jade", description: "A light, slightly fruity white tea.", brew_time: 3, temperature: 195.6)

      sub1 = Subscription.create!(title: "White Tea Addict", frequency: 0, price: 1499, tea_id: tea1.id )
      cust_sub = CustomerSubscription.create!(customer_id: customer1.id, subscription_id: sub1.id)

      expect(cust_sub.tea_name).to eq("White Jade")
      expect(cust_sub.sub_frequency).to eq("weekly")
      expect(cust_sub.cost).to eq(14.99)
      expect(cust_sub.sub_title).to eq("White Tea Addict")
      expect(cust_sub.status).to eq("active") #not an instance method, checking default
    end
  end
end
