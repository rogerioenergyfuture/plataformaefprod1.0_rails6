require "application_system_test_case"

class SumEvaluationsTest < ApplicationSystemTestCase
  setup do
    @sum_evaluation = sum_evaluations(:one)
  end

  test "visiting the index" do
    visit sum_evaluations_url
    assert_selector "h1", text: "Sum Evaluations"
  end

  test "creating a Sum evaluation" do
    visit sum_evaluations_url
    click_on "New Sum Evaluation"

    fill_in "Deadline", with: @sum_evaluation.deadline
    fill_in "Kind", with: @sum_evaluation.kind
    click_on "Create Sum evaluation"

    assert_text "Sum evaluation was successfully created"
    click_on "Back"
  end

  test "updating a Sum evaluation" do
    visit sum_evaluations_url
    click_on "Edit", match: :first

    fill_in "Deadline", with: @sum_evaluation.deadline
    fill_in "Kind", with: @sum_evaluation.kind
    click_on "Update Sum evaluation"

    assert_text "Sum evaluation was successfully updated"
    click_on "Back"
  end

  test "destroying a Sum evaluation" do
    visit sum_evaluations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sum evaluation was successfully destroyed"
  end
end
