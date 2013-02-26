require 'test_helper'

class CivilStatesControllerTest < ActionController::TestCase
  setup do
    @civil_state = civil_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:civil_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create civil_state" do
    assert_difference('CivilState.count') do
      post :create, civil_state: { name: @civil_state.name }
    end

    assert_redirected_to civil_state_path(assigns(:civil_state))
  end

  test "should show civil_state" do
    get :show, id: @civil_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @civil_state
    assert_response :success
  end

  test "should update civil_state" do
    put :update, id: @civil_state, civil_state: { name: @civil_state.name }
    assert_redirected_to civil_state_path(assigns(:civil_state))
  end

  test "should destroy civil_state" do
    assert_difference('CivilState.count', -1) do
      delete :destroy, id: @civil_state
    end

    assert_redirected_to civil_states_path
  end
end
