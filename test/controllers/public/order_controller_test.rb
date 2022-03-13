require "test_helper"

class Public::OrderControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_order_new_url
    assert_response :success
  end
end
