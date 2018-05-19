class User < ApplicationRecord
  has_one :subscription

  def apply_subscription
    SubscriptionService.new(self).apply
  end
end
