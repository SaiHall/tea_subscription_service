class Subscription < ApplicationRecord

  belongs_to :tea
  has_many :customer_subscriptions

  validates_presence_of :title
  enum status:["active", "canceled"]
  validates_presence_of :price
  enum frequency:["weekly", "monthly", "biannually", "annually"]
end
