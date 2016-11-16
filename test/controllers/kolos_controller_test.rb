require 'test_helper'

class KolosControllerTest < ActionController::TestCase
  setup do
    @kolo = kolos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kolos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kolo" do
    assert_difference('Kolo.count') do
      post :create, kolo: { cislo: @kolo.cislo }
    end

    assert_redirected_to kolo_path(assigns(:kolo))
  end

  test "should show kolo" do
    get :show, id: @kolo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kolo
    assert_response :success
  end

  test "should update kolo" do
    patch :update, id: @kolo, kolo: { cislo: @kolo.cislo }
    assert_redirected_to kolo_path(assigns(:kolo))
  end

  test "should destroy kolo" do
    assert_difference('Kolo.count', -1) do
      delete :destroy, id: @kolo
    end

    assert_redirected_to kolos_path
  end
end
