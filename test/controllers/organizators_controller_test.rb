require 'test_helper'

class OrganizatorsControllerTest < ActionController::TestCase
  setup do
    @organizator = organizators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organizator" do
    assert_difference('Organizator.count') do
      post :create, organizator: { email: @organizator.email, meno: @organizator.meno, nick: @organizator.nick, priezvisko: @organizator.priezvisko, status: @organizator.status, telefon: @organizator.telefon }
    end

    assert_redirected_to organizator_path(assigns(:organizator))
  end

  test "should show organizator" do
    get :show, id: @organizator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organizator
    assert_response :success
  end

  test "should update organizator" do
    patch :update, id: @organizator, organizator: { email: @organizator.email, meno: @organizator.meno, nick: @organizator.nick, priezvisko: @organizator.priezvisko, status: @organizator.status, telefon: @organizator.telefon }
    assert_redirected_to organizator_path(assigns(:organizator))
  end

  test "should destroy organizator" do
    assert_difference('Organizator.count', -1) do
      delete :destroy, id: @organizator
    end

    assert_redirected_to organizators_path
  end
end
