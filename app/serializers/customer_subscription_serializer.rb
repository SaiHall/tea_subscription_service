class CustomerSubscriptionSerializer

  def self.new_sub(cust_sub)
    {
      data: {
        customer: "#{cust_sub.customer.first_name} #{cust_sub.customer.last_name}",
        tea: cust_sub.tea_name,
        frequency: cust_sub.sub_frequency,
        cost: cust_sub.cost,
        status: cust_sub.status
      }
    }
  end

  def self.update_sub(cust_sub)
    {
      data: {
        customer: "#{cust_sub.customer.first_name} #{cust_sub.customer.last_name}",
        tea: cust_sub.tea_name,
        frequency: cust_sub.sub_frequency,
        cost: cust_sub.cost,
        status: cust_sub.status
      }
    }
  end
end
