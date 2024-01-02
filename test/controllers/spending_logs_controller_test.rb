require "test_helper"

class SpendingLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spending_logs_index_url
    assert_response :success
  end

  test "should get new" do
    get spending_logs_new_url
    assert_response :success
  end

  test "should get create" do
    get spending_logs_create_url
    assert_response :success
  end
end
