require 'test_helper'

class RiesitelSeriaControllerTest < ActionController::TestCase
  setup do
    @riesitel_serium = riesitel_seria(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:riesitel_seria)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create riesitel_serium" do
    assert_difference('RiesitelSerium.count') do
      post :create, riesitel_serium: { eriesitel: @riesitel_serium.eriesitel, kategoria: @riesitel_serium.kategoria, rocnik: @riesitel_serium.rocnik, seria: @riesitel_serium.seria, skola: @riesitel_serium.skola, trieda: @riesitel_serium.trieda }
    end

    assert_redirected_to riesitel_serium_path(assigns(:riesitel_serium))
  end

  test "should show riesitel_serium" do
    get :show, id: @riesitel_serium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @riesitel_serium
    assert_response :success
  end

  test "should update riesitel_serium" do
    patch :update, id: @riesitel_serium, riesitel_serium: { eriesitel: @riesitel_serium.eriesitel, kategoria: @riesitel_serium.kategoria, rocnik: @riesitel_serium.rocnik, seria: @riesitel_serium.seria, skola: @riesitel_serium.skola, trieda: @riesitel_serium.trieda }
    assert_redirected_to riesitel_serium_path(assigns(:riesitel_serium))
  end

  test "should destroy riesitel_serium" do
    assert_difference('RiesitelSerium.count', -1) do
      delete :destroy, id: @riesitel_serium
    end

    assert_redirected_to riesitel_seria_path
  end
end
