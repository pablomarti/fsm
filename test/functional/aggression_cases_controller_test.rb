require 'test_helper'

class AggressionCasesControllerTest < ActionController::TestCase
  setup do
    @aggression_case = aggression_cases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aggression_cases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aggression_case" do
    assert_difference('AggressionCase.count') do
      post :create, aggression_case: { name: @aggression_case.name }
    end

    assert_redirected_to aggression_case_path(assigns(:aggression_case))
  end

  test "should show aggression_case" do
    get :show, id: @aggression_case
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aggression_case
    assert_response :success
  end

  test "should update aggression_case" do
    put :update, id: @aggression_case, aggression_case: { name: @aggression_case.name }
    assert_redirected_to aggression_case_path(assigns(:aggression_case))
  end

  test "should destroy aggression_case" do
    assert_difference('AggressionCase.count', -1) do
      delete :destroy, id: @aggression_case
    end

    assert_redirected_to aggression_cases_path
  end
end
