require 'test_helper'

class KnizkasControllerTest < ActionController::TestCase
  setup do
    @knizka = knizkas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:knizkas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create knizka" do
    assert_difference('Knizka.count') do
      post :create, knizka: {  }
    end

    assert_redirected_to knizka_path(assigns(:knizka))
  end

  test "should show knizka" do
    get :show, id: @knizka
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @knizka
    assert_response :success
  end

  test "should update knizka" do
    patch :update, id: @knizka, knizka: {  }
    assert_redirected_to knizka_path(assigns(:knizka))
  end

  test "should destroy knizka" do
    assert_difference('Knizka.count', -1) do
      delete :destroy, id: @knizka
    end

    assert_redirected_to knizkas_path
  end
end
