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
end