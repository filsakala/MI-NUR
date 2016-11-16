require 'test_helper'

class KomentarsControllerTest < ActionController::TestCase
  setup do
    @komentar = komentars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:komentars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create komentar" do
    assert_difference('Komentar.count') do
      post :create, komentar: { autor: @komentar.autor, text: @komentar.text }
    end

    assert_redirected_to komentar_path(assigns(:komentar))
  end

  test "should show komentar" do
    get :show, id: @komentar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @komentar
    assert_response :success
  end

  test "should update komentar" do
    patch :update, id: @komentar, komentar: { autor: @komentar.autor, text: @komentar.text }
    assert_redirected_to komentar_path(assigns(:komentar))
  end

  test "should destroy komentar" do
    assert_difference('Komentar.count', -1) do
      delete :destroy, id: @komentar
    end

    assert_redirected_to komentars_path
  end
end
