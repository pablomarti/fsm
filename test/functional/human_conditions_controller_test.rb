require 'test_helper'

class HumanConditionsControllerTest < ActionController::TestCase
  setup do
    @human_condition = human_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:human_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create human_condition" do
    assert_difference('HumanCondition.count') do
      post :create, human_condition: { name: @human_condition.name }
    end

    assert_redirected_to human_condition_path(assigns(:human_condition))
  end

  test "should show human_condition" do
    get :show, id: @human_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @human_condition
    assert_response :success
  end

  test "should update human_condition" do
    put :update, id: @human_condition, human_condition: { name: @human_condition.name }
    assert_redirected_to human_condition_path(assigns(:human_condition))
  end

  test "should destroy human_condition" do
    assert_difference('HumanCondition.count', -1) do
      delete :destroy, id: @human_condition
    end

    assert_redirected_to human_conditions_path
  end
end
