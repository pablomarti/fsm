require 'test_helper'

class EmotionalConditionsControllerTest < ActionController::TestCase
  setup do
    @emotional_condition = emotional_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emotional_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emotional_condition" do
    assert_difference('EmotionalCondition.count') do
      post :create, emotional_condition: { name: @emotional_condition.name }
    end

    assert_redirected_to emotional_condition_path(assigns(:emotional_condition))
  end

  test "should show emotional_condition" do
    get :show, id: @emotional_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @emotional_condition
    assert_response :success
  end

  test "should update emotional_condition" do
    put :update, id: @emotional_condition, emotional_condition: { name: @emotional_condition.name }
    assert_redirected_to emotional_condition_path(assigns(:emotional_condition))
  end

  test "should destroy emotional_condition" do
    assert_difference('EmotionalCondition.count', -1) do
      delete :destroy, id: @emotional_condition
    end

    assert_redirected_to emotional_conditions_path
  end
end
