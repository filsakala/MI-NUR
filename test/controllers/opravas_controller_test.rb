require 'test_helper'

class OpravasControllerTest < ActionController::TestCase
  setup do
    @oprava = opravas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opravas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create oprava" do
    assert_difference('Oprava.count') do
      post :create, oprava: { kolo: @oprava.kolo, priklady: @oprava.priklady, rocnik: @oprava.rocnik, seria: @oprava.seria }
    end

    assert_redirected_to oprava_path(assigns(:oprava))
  end

  test "should show oprava" do
    get :show, id: @oprava
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @oprava
    assert_response :success
  end

  test "should update oprava" do
    patch :update, id: @oprava, oprava: { kolo: @oprava.kolo, priklady: @oprava.priklady, rocnik: @oprava.rocnik, seria: @oprava.seria }
    assert_redirected_to oprava_path(assigns(:oprava))
  end

  test "should destroy oprava" do
    assert_difference('Oprava.count', -1) do
      delete :destroy, id: @oprava
    end

    assert_redirected_to opravas_path
  end
end
