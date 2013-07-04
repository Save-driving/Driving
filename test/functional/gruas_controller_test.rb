require 'test_helper'

class GruasControllerTest < ActionController::TestCase
  setup do
    @grua = gruas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gruas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grua" do
    assert_difference('Grua.count') do
      post :create, grua: { direccion: @grua.direccion, email: @grua.email, nombres: @grua.nombres, numero_doc: @grua.numero_doc, observaciones: @grua.observaciones, telefonos: @grua.telefonos }
    end

    assert_redirected_to grua_path(assigns(:grua))
  end

  test "should show grua" do
    get :show, id: @grua
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grua
    assert_response :success
  end

  test "should update grua" do
    put :update, id: @grua, grua: { direccion: @grua.direccion, email: @grua.email, nombres: @grua.nombres, numero_doc: @grua.numero_doc, observaciones: @grua.observaciones, telefonos: @grua.telefonos }
    assert_redirected_to grua_path(assigns(:grua))
  end

  test "should destroy grua" do
    assert_difference('Grua.count', -1) do
      delete :destroy, id: @grua
    end

    assert_redirected_to gruas_path
  end
end
