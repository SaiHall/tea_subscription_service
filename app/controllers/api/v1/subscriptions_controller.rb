class Api::V1::SubscriptionsController < ApplicationController

  def create
    cust_sub = CustomerSubscription.create!(sub_params)
    render json: CustomerSubscriptionSerializer.new_sub(cust_sub)
  end

  private
  def sub_params
    params.permit(:customer_id, :subscription_id)
  end

end
