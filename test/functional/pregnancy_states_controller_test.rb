require 'test_helper'

class PregnancyStatesControllerTest < ActionController::TestCase
  setup do
    @pregnancy_state = pregnancy_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pregnancy_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pregnancy_state" do
    assert_difference('PregnancyState.count') do
      post :create, pregnancy_state: { name: @pregnancy_state.name }
    end

    assert_redirected_to pregnancy_state_path(assigns(:pregnancy_state))
  end

  test "should show pregnancy_state" do
    get :show, id: @pregnancy_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pregnancy_state
    assert_response :success
  end

  test "should update pregnancy_state" do
    put :update, id: @pregnancy_state, pregnancy_state: { name: @pregnancy_state.name }
    assert_redirected_to pregnancy_state_path(assigns(:pregnancy_state))
  end

  test "should destroy pregnancy_state" do
    assert_difference('PregnancyState.count', -1) do
      delete :destroy, id: @pregnancy_state
    end

    assert_redirected_to pregnancy_states_path
  end
end
