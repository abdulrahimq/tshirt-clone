require 'test_helper'

class TshirtsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tshirts_index_url
    assert_response :success
  end

  test "should get new" do
    get tshirts_new_url
    assert_response :success
  end

  test "should get create" do
    get tshirts_create_url
    assert_response :success
  end

end
