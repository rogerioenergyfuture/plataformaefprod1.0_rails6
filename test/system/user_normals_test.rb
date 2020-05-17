require "application_system_test_case"

class UserNormalsTest < ApplicationSystemTestCase
  setup do
    @user_normal = user_normals(:one)
  end

  test "visiting the index" do
    visit user_normals_url
    assert_selector "h1", text: "User Normals"
  end

  test "creating a User normal" do
    visit user_normals_url
    click_on "New User Normal"

    fill_in "Name", with: @user_normal.name
    fill_in "Status", with: @user_normal.status
    fill_in "User", with: @user_normal.user_id
    click_on "Create User normal"

    assert_text "User normal was successfully created"
    click_on "Back"
  end

  test "updating a User normal" do
    visit user_normals_url
    click_on "Edit", match: :first

    fill_in "Name", with: @user_normal.name
    fill_in "Status", with: @user_normal.status
    fill_in "User", with: @user_normal.user_id
    click_on "Update User normal"

    assert_text "User normal was successfully updated"
    click_on "Back"
  end

  test "destroying a User normal" do
    visit user_normals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User normal was successfully destroyed"
  end
end
