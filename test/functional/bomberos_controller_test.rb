require 'test_helper'

class BomberosControllerTest < ActionController::TestCase
  setup do
    @bombero = bomberos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bomberos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bombero" do
    assert_difference('Bombero.count') do
      post :create, bombero: { direccion: @bombero.direccion, email: @bombero.email, nombres: @bombero.nombres, numero_doc: @bombero.numero_doc, observaciones: @bombero.observaciones, telefonos: @bombero.telefonos }
    end

    assert_redirected_to bombero_path(assigns(:bombero))
  end

  test "should show bombero" do
    get :show, id: @bombero
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bombero
    assert_response :success
  end

  test "should update bombero" do
    put :update, id: @bombero, bombero: { direccion: @bombero.direccion, email: @bombero.email, nombres: @bombero.nombres, numero_doc: @bombero.numero_doc, observaciones: @bombero.observaciones, telefonos: @bombero.telefonos }
    assert_redirected_to bombero_path(assigns(:bombero))
  end

  test "should destroy bombero" do
    assert_difference('Bombero.count', -1) do
      delete :destroy, id: @bombero
    end

    assert_redirected_to bomberos_path
  end
end
