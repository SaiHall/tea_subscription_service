class Subscription < ApplicationRecord

  belongs_to :tea
  belongs_to :customer

  validates_presence_of :title
  enum status:["active", "canceled"]
  validates_presence_of :price
  enum frequency:["weekly", "monthly", "biannually", "annually"]
end
