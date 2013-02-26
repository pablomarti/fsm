require 'test_helper'

class OcupationsControllerTest < ActionController::TestCase
  setup do
    @ocupation = ocupations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ocupations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ocupation" do
    assert_difference('Ocupation.count') do
      post :create, ocupation: { name: @ocupation.name }
    end

    assert_redirected_to ocupation_path(assigns(:ocupation))
  end

  test "should show ocupation" do
    get :show, id: @ocupation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ocupation
    assert_response :success
  end

  test "should update ocupation" do
    put :update, id: @ocupation, ocupation: { name: @ocupation.name }
    assert_redirected_to ocupation_path(assigns(:ocupation))
  end

  test "should destroy ocupation" do
    assert_difference('Ocupation.count', -1) do
      delete :destroy, id: @ocupation
    end

    assert_redirected_to ocupations_path
  end
end
