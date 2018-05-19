require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :all

  it '#apply_subscription' do
    expect_any_instance_of(SubscriptionService).to receive(:apply)
    user = users(:one)
    user.apply_subscription
  end
end
