require 'test_helper'

class UserNormalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_normal = user_normals(:one)
  end

  test "should get index" do
    get user_normals_url
    assert_response :success
  end

  test "should get new" do
    get new_user_normal_url
    assert_response :success
  end

  test "should create user_normal" do
    assert_difference('UserNormal.count') do
      post user_normals_url, params: { user_normal: { name: @user_normal.name, status: @user_normal.status, user_id: @user_normal.user_id } }
    end

    assert_redirected_to user_normal_url(UserNormal.last)
  end

  test "should show user_normal" do
    get user_normal_url(@user_normal)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_normal_url(@user_normal)
    assert_response :success
  end

  test "should update user_normal" do
    patch user_normal_url(@user_normal), params: { user_normal: { name: @user_normal.name, status: @user_normal.status, user_id: @user_normal.user_id } }
    assert_redirected_to user_normal_url(@user_normal)
  end

  test "should destroy user_normal" do
    assert_difference('UserNormal.count', -1) do
      delete user_normal_url(@user_normal)
    end

    assert_redirected_to user_normals_url
  end
end
