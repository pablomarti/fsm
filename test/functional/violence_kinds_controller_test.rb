require 'test_helper'

class ViolenceKindsControllerTest < ActionController::TestCase
  setup do
    @violence_kind = violence_kinds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:violence_kinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create violence_kind" do
    assert_difference('ViolenceKind.count') do
      post :create, violence_kind: { name: @violence_kind.name }
    end

    assert_redirected_to violence_kind_path(assigns(:violence_kind))
  end

  test "should show violence_kind" do
    get :show, id: @violence_kind
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @violence_kind
    assert_response :success
  end

  test "should update violence_kind" do
    put :update, id: @violence_kind, violence_kind: { name: @violence_kind.name }
    assert_redirected_to violence_kind_path(assigns(:violence_kind))
  end

  test "should destroy violence_kind" do
    assert_difference('ViolenceKind.count', -1) do
      delete :destroy, id: @violence_kind
    end

    assert_redirected_to violence_kinds_path
  end
end
