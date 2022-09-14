class Api::V1::SubscriptionsController < ApplicationController

  def create
    Subscription.create!(sub_params)
  end

  private
  def sub_params
    params.permit(:customer_id, :tea_id, :frequency, :price, :title)
  end

end
