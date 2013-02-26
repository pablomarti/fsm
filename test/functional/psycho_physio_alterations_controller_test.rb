require 'test_helper'

class PsychoPhysioAlterationsControllerTest < ActionController::TestCase
  setup do
    @psycho_physio_alteration = psycho_physio_alterations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:psycho_physio_alterations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create psycho_physio_alteration" do
    assert_difference('PsychoPhysioAlteration.count') do
      post :create, psycho_physio_alteration: { name: @psycho_physio_alteration.name }
    end

    assert_redirected_to psycho_physio_alteration_path(assigns(:psycho_physio_alteration))
  end

  test "should show psycho_physio_alteration" do
    get :show, id: @psycho_physio_alteration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @psycho_physio_alteration
    assert_response :success
  end

  test "should update psycho_physio_alteration" do
    put :update, id: @psycho_physio_alteration, psycho_physio_alteration: { name: @psycho_physio_alteration.name }
    assert_redirected_to psycho_physio_alteration_path(assigns(:psycho_physio_alteration))
  end

  test "should destroy psycho_physio_alteration" do
    assert_difference('PsychoPhysioAlteration.count', -1) do
      delete :destroy, id: @psycho_physio_alteration
    end

    assert_redirected_to psycho_physio_alterations_path
  end
end
