require 'test_helper'

class WeaponKindsControllerTest < ActionController::TestCase
  setup do
    @weapon_kind = weapon_kinds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weapon_kinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weapon_kind" do
    assert_difference('WeaponKind.count') do
      post :create, weapon_kind: { name: @weapon_kind.name }
    end

    assert_redirected_to weapon_kind_path(assigns(:weapon_kind))
  end

  test "should show weapon_kind" do
    get :show, id: @weapon_kind
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weapon_kind
    assert_response :success
  end

  test "should update weapon_kind" do
    put :update, id: @weapon_kind, weapon_kind: { name: @weapon_kind.name }
    assert_redirected_to weapon_kind_path(assigns(:weapon_kind))
  end

  test "should destroy weapon_kind" do
    assert_difference('WeaponKind.count', -1) do
      delete :destroy, id: @weapon_kind
    end

    assert_redirected_to weapon_kinds_path
  end
end
