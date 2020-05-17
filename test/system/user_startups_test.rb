require "application_system_test_case"

class UserStartupsTest < ApplicationSystemTestCase
  setup do
    @user_startup = user_startups(:one)
  end

  test "visiting the index" do
    visit user_startups_url
    assert_selector "h1", text: "User Startups"
  end

  test "creating a User startup" do
    visit user_startups_url
    click_on "New User Startup"

    fill_in "Name", with: @user_startup.name
    fill_in "Status", with: @user_startup.status
    fill_in "User", with: @user_startup.user_id
    click_on "Create User startup"

    assert_text "User startup was successfully created"
    click_on "Back"
  end

  test "updating a User startup" do
    visit user_startups_url
    click_on "Edit", match: :first

    fill_in "Name", with: @user_startup.name
    fill_in "Status", with: @user_startup.status
    fill_in "User", with: @user_startup.user_id
    click_on "Update User startup"

    assert_text "User startup was successfully updated"
    click_on "Back"
  end

  test "destroying a User startup" do
    visit user_startups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User startup was successfully destroyed"
  end
end
