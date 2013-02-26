require 'test_helper'

class ZoneKindsControllerTest < ActionController::TestCase
  setup do
    @zone_kind = zone_kinds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zone_kinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zone_kind" do
    assert_difference('ZoneKind.count') do
      post :create, zone_kind: { name: @zone_kind.name }
    end

    assert_redirected_to zone_kind_path(assigns(:zone_kind))
  end

  test "should show zone_kind" do
    get :show, id: @zone_kind
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zone_kind
    assert_response :success
  end

  test "should update zone_kind" do
    put :update, id: @zone_kind, zone_kind: { name: @zone_kind.name }
    assert_redirected_to zone_kind_path(assigns(:zone_kind))
  end

  test "should destroy zone_kind" do
    assert_difference('ZoneKind.count', -1) do
      delete :destroy, id: @zone_kind
    end

    assert_redirected_to zone_kinds_path
  end
end
