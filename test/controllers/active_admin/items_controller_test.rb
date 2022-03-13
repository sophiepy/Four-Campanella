require "test_helper"

class ActiveAdmin::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get active_admin_items_index_url
    assert_response :success
  end
end
