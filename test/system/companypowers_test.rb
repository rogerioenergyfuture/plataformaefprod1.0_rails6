require "application_system_test_case"

class CompanypowersTest < ApplicationSystemTestCase
  setup do
    @companypower = companypowers(:one)
  end

  test "visiting the index" do
    visit companypowers_url
    assert_selector "h1", text: "Companypowers"
  end

  test "creating a Companypower" do
    visit companypowers_url
    click_on "New Companypower"

    fill_in "Name", with: @companypower.name
    fill_in "Responsibleemail", with: @companypower.responsibleemail
    fill_in "Status", with: @companypower.status
    fill_in "Type", with: @companypower.type
    click_on "Create Companypower"

    assert_text "Companypower was successfully created"
    click_on "Back"
  end

  test "updating a Companypower" do
    visit companypowers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @companypower.name
    fill_in "Responsibleemail", with: @companypower.responsibleemail
    fill_in "Status", with: @companypower.status
    fill_in "Type", with: @companypower.type
    click_on "Update Companypower"

    assert_text "Companypower was successfully updated"
    click_on "Back"
  end

  test "destroying a Companypower" do
    visit companypowers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Companypower was successfully destroyed"
  end
end
