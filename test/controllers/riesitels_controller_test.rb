require 'test_helper'

class RiesitelsControllerTest < ActionController::TestCase
  setup do
    @riesitel = riesitels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:riesitels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create riesitel" do
    assert_difference('Riesitel.count') do
      post :create, riesitel: { adresa: @riesitel.adresa, datum_narodenia: @riesitel.datum_narodenia, email: @riesitel.email, meno: @riesitel.meno, priezvisko: @riesitel.priezvisko, telefon: @riesitel.telefon, telefon_rodic: @riesitel.telefon_rodic }
    end

    assert_redirected_to riesitel_path(assigns(:riesitel))
  end

  test "should show riesitel" do
    get :show, id: @riesitel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @riesitel
    assert_response :success
  end

  test "should update riesitel" do
    patch :update, id: @riesitel, riesitel: { adresa: @riesitel.adresa, datum_narodenia: @riesitel.datum_narodenia, email: @riesitel.email, meno: @riesitel.meno, priezvisko: @riesitel.priezvisko, telefon: @riesitel.telefon, telefon_rodic: @riesitel.telefon_rodic }
    assert_redirected_to riesitel_path(assigns(:riesitel))
  end

  test "should destroy riesitel" do
    assert_difference('Riesitel.count', -1) do
      delete :destroy, id: @riesitel
    end

    assert_redirected_to riesitels_path
  end
end
