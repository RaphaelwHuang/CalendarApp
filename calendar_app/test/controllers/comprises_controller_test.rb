require 'test_helper'

class ComprisesControllerTest < ActionController::TestCase
  setup do
    @comprise = comprises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comprises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comprise" do
    assert_difference('Comprise.count') do
      post :create, comprise: { group_id: @comprise.group_id, user_id: @comprise.user_id }
    end

    assert_redirected_to comprise_path(assigns(:comprise))
  end

  test "should show comprise" do
    get :show, id: @comprise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comprise
    assert_response :success
  end

  test "should update comprise" do
    patch :update, id: @comprise, comprise: { group_id: @comprise.group_id, user_id: @comprise.user_id }
    assert_redirected_to comprise_path(assigns(:comprise))
  end

  test "should destroy comprise" do
    assert_difference('Comprise.count', -1) do
      delete :destroy, id: @comprise
    end

    assert_redirected_to comprises_path
  end
end
