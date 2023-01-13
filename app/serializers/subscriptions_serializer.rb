class SubscriptionsSerializer 
  def self.create(subscription)
    {
      data: {
        id: subscription.id,
        type: "Subscription",
        attributes: {
          title: subscription.title,
          price: subscription.price,
          status: subscription.status,
          frequency: subscription.frequency,
          customer_id: subscription.customer_id,
          tea_id: subscription.tea_id
        }
      }
    }
  end

  def self.index(customer)
    {
      data: {
        customer_id: customer.id,
        customer_email: customer.email,
        type: "Subscription Index",
        subscriptions: customer.subscriptions.map do |subscription| 
          {
            id: subscription.id,
            type: "Subscription",
            attributes: {
              status: subscription.status,
              frequency: subscription.frequency 
            }
          }
          end
      }
    }
  end

  def self.update(subscription)
    {
      data: {
        id: subscription.id,
        type: "Subscription",
        attributes: {
          status: subscription.status
        }
      }
    }
  end
end