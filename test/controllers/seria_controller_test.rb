require 'test_helper'

class SeriaControllerTest < ActionController::TestCase
  setup do
    @serium = seria(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seria)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create serium" do
    assert_difference('Serium.count') do
      post :create, serium: { nazov: @serium.nazov }
    end

    assert_redirected_to serium_path(assigns(:serium))
  end

  test "should show serium" do
    get :show, id: @serium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @serium
    assert_response :success
  end

  test "should update serium" do
    patch :update, id: @serium, serium: { nazov: @serium.nazov }
    assert_redirected_to serium_path(assigns(:serium))
  end

  test "should destroy serium" do
    assert_difference('Serium.count', -1) do
      delete :destroy, id: @serium
    end

    assert_redirected_to seria_path
  end
end
