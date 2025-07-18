require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get move" do
    get transactions_move_url
    assert_response :success
  end

  test "should get spend" do
    get transactions_spend_url
    assert_response :success
  end
end
