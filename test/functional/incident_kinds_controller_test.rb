require 'test_helper'

class IncidentKindsControllerTest < ActionController::TestCase
  setup do
    @incident_kind = incident_kinds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incident_kinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incident_kind" do
    assert_difference('IncidentKind.count') do
      post :create, incident_kind: { name: @incident_kind.name }
    end

    assert_redirected_to incident_kind_path(assigns(:incident_kind))
  end

  test "should show incident_kind" do
    get :show, id: @incident_kind
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incident_kind
    assert_response :success
  end

  test "should update incident_kind" do
    put :update, id: @incident_kind, incident_kind: { name: @incident_kind.name }
    assert_redirected_to incident_kind_path(assigns(:incident_kind))
  end

  test "should destroy incident_kind" do
    assert_difference('IncidentKind.count', -1) do
      delete :destroy, id: @incident_kind
    end

    assert_redirected_to incident_kinds_path
  end
end
