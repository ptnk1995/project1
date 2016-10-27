require 'test_helper'

class Admin::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_user_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_user_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_user_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_user_edit_url
    assert_response :success
  end

end
