require 'test_helper'

class SumEvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sum_evaluation = sum_evaluations(:one)
  end

  test "should get index" do
    get sum_evaluations_url
    assert_response :success
  end

  test "should get new" do
    get new_sum_evaluation_url
    assert_response :success
  end

  test "should create sum_evaluation" do
    assert_difference('SumEvaluation.count') do
      post sum_evaluations_url, params: { sum_evaluation: { deadline: @sum_evaluation.deadline, kind: @sum_evaluation.kind } }
    end

    assert_redirected_to sum_evaluation_url(SumEvaluation.last)
  end

  test "should show sum_evaluation" do
    get sum_evaluation_url(@sum_evaluation)
    assert_response :success
  end

  test "should get edit" do
    get edit_sum_evaluation_url(@sum_evaluation)
    assert_response :success
  end

  test "should update sum_evaluation" do
    patch sum_evaluation_url(@sum_evaluation), params: { sum_evaluation: { deadline: @sum_evaluation.deadline, kind: @sum_evaluation.kind } }
    assert_redirected_to sum_evaluation_url(@sum_evaluation)
  end

  test "should destroy sum_evaluation" do
    assert_difference('SumEvaluation.count', -1) do
      delete sum_evaluation_url(@sum_evaluation)
    end

    assert_redirected_to sum_evaluations_url
  end
end
