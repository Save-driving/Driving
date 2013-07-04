require 'test_helper'

class ParqueaderosControllerTest < ActionController::TestCase
  setup do
    @parqueadero = parqueaderos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parqueaderos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parqueadero" do
    assert_difference('Parqueadero.count') do
      post :create, parqueadero: { direccion: @parqueadero.direccion, email: @parqueadero.email, nombres: @parqueadero.nombres, numero_doc: @parqueadero.numero_doc, observaciones: @parqueadero.observaciones, telefonos: @parqueadero.telefonos }
    end

    assert_redirected_to parqueadero_path(assigns(:parqueadero))
  end

  test "should show parqueadero" do
    get :show, id: @parqueadero
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parqueadero
    assert_response :success
  end

  test "should update parqueadero" do
    put :update, id: @parqueadero, parqueadero: { direccion: @parqueadero.direccion, email: @parqueadero.email, nombres: @parqueadero.nombres, numero_doc: @parqueadero.numero_doc, observaciones: @parqueadero.observaciones, telefonos: @parqueadero.telefonos }
    assert_redirected_to parqueadero_path(assigns(:parqueadero))
  end

  test "should destroy parqueadero" do
    assert_difference('Parqueadero.count', -1) do
      delete :destroy, id: @parqueadero
    end

    assert_redirected_to parqueaderos_path
  end
end
