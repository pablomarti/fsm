require 'test_helper'

class SystemCasesControllerTest < ActionController::TestCase
  setup do
    @system_case = system_cases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:system_cases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create system_case" do
    assert_difference('SystemCase.count') do
      post :create, system_case: { aggression_date: @system_case.aggression_date, complaint: @system_case.complaint, recidivism: @system_case.recidivism }
    end

    assert_redirected_to system_case_path(assigns(:system_case))
  end

  test "should show system_case" do
    get :show, id: @system_case
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @system_case
    assert_response :success
  end

  test "should update system_case" do
    put :update, id: @system_case, system_case: { aggression_date: @system_case.aggression_date, complaint: @system_case.complaint, recidivism: @system_case.recidivism }
    assert_redirected_to system_case_path(assigns(:system_case))
  end

  test "should destroy system_case" do
    assert_difference('SystemCase.count', -1) do
      delete :destroy, id: @system_case
    end

    assert_redirected_to system_cases_path
  end
end
