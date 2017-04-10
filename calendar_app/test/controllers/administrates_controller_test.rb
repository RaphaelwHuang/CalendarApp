require 'test_helper'

class AdministratesControllerTest < ActionController::TestCase
  setup do
    @administrate = administrates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administrates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administrate" do
    assert_difference('Administrate.count') do
      post :create, administrate: { group_id: @administrate.group_id, user_id: @administrate.user_id }
    end

    assert_redirected_to administrate_path(assigns(:administrate))
  end

  test "should show administrate" do
    get :show, id: @administrate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administrate
    assert_response :success
  end

  test "should update administrate" do
    patch :update, id: @administrate, administrate: { group_id: @administrate.group_id, user_id: @administrate.user_id }
    assert_redirected_to administrate_path(assigns(:administrate))
  end

  test "should destroy administrate" do
    assert_difference('Administrate.count', -1) do
      delete :destroy, id: @administrate
    end

    assert_redirected_to administrates_path
  end
end
