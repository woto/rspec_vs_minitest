class SubscriptionService
  SUBSCRIPTION_LENGTH = 1.month

  def initialize(user)
    @user = user
  end

  def apply
    if Subscription.exists?(user_id: @user.id)
      extend_subscription
    else
      create_subscription
    end
  end

  private

  def create_subscription
    subscription = Subscription.new(
      user: @user,
      expires_at: SUBSCRIPTION_LENGTH.from_now
    )

    subscription.save
  end

  def extend_subscription
    subscription = Subscription.find_by user_id: @user.id

    subscription.expires_at = subscription.expires_at + SUBSCRIPTION_LENGTH
    subscription.save
  end
end
