require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#apply_subscription' do
    mock = Minitest::Mock.new
    mock.expect :apply, true

    SubscriptionService.stub :new, mock do
      user = users(:one)
      assert user.apply_subscription
    end

    assert_mock mock
  end
end
