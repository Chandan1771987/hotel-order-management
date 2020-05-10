require 'test_helper'

class OrderPaymentInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_payment_info_index_url
    assert_response :success
  end

  test "should get show" do
    get order_payment_info_show_url
    assert_response :success
  end

  test "should get create" do
    get order_payment_info_create_url
    assert_response :success
  end

  test "should get destroy" do
    get order_payment_info_destroy_url
    assert_response :success
  end

  test "should get update" do
    get order_payment_info_update_url
    assert_response :success
  end

end
