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
        subscription: cust_sub.sub_title,
        frequency: cust_sub.sub_frequency,
        status: cust_sub.status
      }
    }
  end

  def self.all_subs(customer)
    {
      data: {
        customer: "#{customer.first_name} #{customer.last_name}",
        subscriptions: customer.customer_subscriptions.map do |sub|
          {
            tea: sub.tea_name,
            subscription: sub.sub_title,
            frequency: sub.sub_frequency,
            cost: sub.cost,
            status: sub.status
          }
        end
      }
    }
  end
end
