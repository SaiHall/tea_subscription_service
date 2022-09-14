class Api::V1::SubscriptionsController < ApplicationController

  def create
    CustomerSubscription.create!(sub_params)
  end

  private
  def sub_params
    params.permit(:customer_id, :subscription_id)
  end

end
