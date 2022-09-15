class CustomerSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription

  validates_presence_of :customer_id
  validates_presence_of :subscription_id
  enum status:["active", "canceled"]


  def tea_name
    subscription.tea.title
  end

  def sub_frequency
    subscription.frequency
  end

  def cost
    subscription.price.to_f / 100.0
  end

  def sub_title
    subscription.title
  end
end
