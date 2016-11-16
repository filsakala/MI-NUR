require 'test_helper'

class PrikladsControllerTest < ActionController::TestCase
  setup do
    @priklad = priklads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:priklads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create priklad" do
    assert_difference('Priklad.count') do
      post :create, priklad: { autor: @priklad.autor, kategoria: @priklad.kategoria, nazov: @priklad.nazov, po_t: @priklad.po_t, pred_t: @priklad.pred_t, stav: @priklad.stav, text: @priklad.text, vzorak: @priklad.vzorak }
    end

    assert_redirected_to priklad_path(assigns(:priklad))
  end

  test "should show priklad" do
    get :show, id: @priklad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @priklad
    assert_response :success
  end

  test "should update priklad" do
    patch :update, id: @priklad, priklad: { autor: @priklad.autor, kategoria: @priklad.kategoria, nazov: @priklad.nazov, po_t: @priklad.po_t, pred_t: @priklad.pred_t, stav: @priklad.stav, text: @priklad.text, vzorak: @priklad.vzorak }
    assert_redirected_to priklad_path(assigns(:priklad))
  end

  test "should destroy priklad" do
    assert_difference('Priklad.count', -1) do
      delete :destroy, id: @priklad
    end

    assert_redirected_to priklads_path
  end
end
