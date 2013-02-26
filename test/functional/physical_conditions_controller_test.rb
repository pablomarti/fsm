require 'test_helper'

class PhysicalConditionsControllerTest < ActionController::TestCase
  setup do
    @physical_condition = physical_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:physical_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create physical_condition" do
    assert_difference('PhysicalCondition.count') do
      post :create, physical_condition: { name: @physical_condition.name }
    end

    assert_redirected_to physical_condition_path(assigns(:physical_condition))
  end

  test "should show physical_condition" do
    get :show, id: @physical_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @physical_condition
    assert_response :success
  end

  test "should update physical_condition" do
    put :update, id: @physical_condition, physical_condition: { name: @physical_condition.name }
    assert_redirected_to physical_condition_path(assigns(:physical_condition))
  end

  test "should destroy physical_condition" do
    assert_difference('PhysicalCondition.count', -1) do
      delete :destroy, id: @physical_condition
    end

    assert_redirected_to physical_conditions_path
  end
end
