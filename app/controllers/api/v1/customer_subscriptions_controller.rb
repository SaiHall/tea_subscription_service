class Api::V1::CustomerSubscriptionsController < ApplicationController

  def create
    cust_sub = CustomerSubscription.create!(sub_params)
    render json: CustomerSubscriptionSerializer.new_sub(cust_sub)
  end

  def update
    active_sub = CustomerSubscription.find(params[:cust_sub])
    active_sub.update!(status: 1)
    render json: CustomerSubscriptionSerializer.update_sub(active_sub)
  end

  def index
    binding.pry
    customer = Customer.find(params["customer_id"])
  end

  private
  def sub_params
    params.permit(:customer_id, :subscription_id)
  end

end
