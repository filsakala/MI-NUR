require 'test_helper'

class RocniksControllerTest < ActionController::TestCase
  setup do
    @rocnik = rocniks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rocniks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rocnik" do
    assert_difference('Rocnik.count') do
      post :create, rocnik: { cislo: @rocnik.cislo }
    end

    assert_redirected_to rocnik_path(assigns(:rocnik))
  end

  test "should show rocnik" do
    get :show, id: @rocnik
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rocnik
    assert_response :success
  end

  test "should update rocnik" do
    patch :update, id: @rocnik, rocnik: { cislo: @rocnik.cislo }
    assert_redirected_to rocnik_path(assigns(:rocnik))
  end

  test "should destroy rocnik" do
    assert_difference('Rocnik.count', -1) do
      delete :destroy, id: @rocnik
    end

    assert_redirected_to rocniks_path
  end
end
