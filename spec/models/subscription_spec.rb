require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should have_many(:customer_subscriptions) }
    it { should belong_to(:tea) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should define_enum_for(:status).with_values([:active, :canceled]) }
    it { should validate_presence_of(:price) }
    it { should define_enum_for(:frequency).with_values([:weekly, :monthly, :biannually, :annually]) }
  end
end
