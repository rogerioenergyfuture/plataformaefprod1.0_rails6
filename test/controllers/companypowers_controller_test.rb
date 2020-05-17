require 'test_helper'

class CompanypowersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @companypower = companypowers(:one)
  end

  test "should get index" do
    get companypowers_url
    assert_response :success
  end

  test "should get new" do
    get new_companypower_url
    assert_response :success
  end

  test "should create companypower" do
    assert_difference('Companypower.count') do
      post companypowers_url, params: { companypower: { name: @companypower.name, responsibleemail: @companypower.responsibleemail, status: @companypower.status, type: @companypower.type } }
    end

    assert_redirected_to companypower_url(Companypower.last)
  end

  test "should show companypower" do
    get companypower_url(@companypower)
    assert_response :success
  end

  test "should get edit" do
    get edit_companypower_url(@companypower)
    assert_response :success
  end

  test "should update companypower" do
    patch companypower_url(@companypower), params: { companypower: { name: @companypower.name, responsibleemail: @companypower.responsibleemail, status: @companypower.status, type: @companypower.type } }
    assert_redirected_to companypower_url(@companypower)
  end

  test "should destroy companypower" do
    assert_difference('Companypower.count', -1) do
      delete companypower_url(@companypower)
    end

    assert_redirected_to companypowers_url
  end
end
