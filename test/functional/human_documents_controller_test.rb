require 'test_helper'

class HumanDocumentsControllerTest < ActionController::TestCase
  setup do
    @human_document = human_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:human_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create human_document" do
    assert_difference('HumanDocument.count') do
      post :create, human_document: { code: @human_document.code }
    end

    assert_redirected_to human_document_path(assigns(:human_document))
  end

  test "should show human_document" do
    get :show, id: @human_document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @human_document
    assert_response :success
  end

  test "should update human_document" do
    put :update, id: @human_document, human_document: { code: @human_document.code }
    assert_redirected_to human_document_path(assigns(:human_document))
  end

  test "should destroy human_document" do
    assert_difference('HumanDocument.count', -1) do
      delete :destroy, id: @human_document
    end

    assert_redirected_to human_documents_path
  end
end
