require 'test_helper'

class UserStartupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_startup = user_startups(:one)
  end

  test "should get index" do
    get user_startups_url
    assert_response :success
  end

  test "should get new" do
    get new_user_startup_url
    assert_response :success
  end

  test "should create user_startup" do
    assert_difference('UserStartup.count') do
      post user_startups_url, params: { user_startup: { name: @user_startup.name, status: @user_startup.status, user_id: @user_startup.user_id } }
    end

    assert_redirected_to user_startup_url(UserStartup.last)
  end

  test "should show user_startup" do
    get user_startup_url(@user_startup)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_startup_url(@user_startup)
    assert_response :success
  end

  test "should update user_startup" do
    patch user_startup_url(@user_startup), params: { user_startup: { name: @user_startup.name, status: @user_startup.status, user_id: @user_startup.user_id } }
    assert_redirected_to user_startup_url(@user_startup)
  end

  test "should destroy user_startup" do
    assert_difference('UserStartup.count', -1) do
      delete user_startup_url(@user_startup)
    end

    assert_redirected_to user_startups_url
  end
end
