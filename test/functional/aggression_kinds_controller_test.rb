require 'test_helper'

class AggressionKindsControllerTest < ActionController::TestCase
  setup do
    @aggression_kind = aggression_kinds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aggression_kinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aggression_kind" do
    assert_difference('AggressionKind.count') do
      post :create, aggression_kind: { name: @aggression_kind.name }
    end

    assert_redirected_to aggression_kind_path(assigns(:aggression_kind))
  end

  test "should show aggression_kind" do
    get :show, id: @aggression_kind
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aggression_kind
    assert_response :success
  end

  test "should update aggression_kind" do
    put :update, id: @aggression_kind, aggression_kind: { name: @aggression_kind.name }
    assert_redirected_to aggression_kind_path(assigns(:aggression_kind))
  end

  test "should destroy aggression_kind" do
    assert_difference('AggressionKind.count', -1) do
      delete :destroy, id: @aggression_kind
    end

    assert_redirected_to aggression_kinds_path
  end
end
