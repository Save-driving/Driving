require 'test_helper'

class DesplazamientosControllerTest < ActionController::TestCase
  setup do
    @desplazamiento = desplazamientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:desplazamientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create desplazamiento" do
    assert_difference('Desplazamiento.count') do
      post :create, desplazamiento: { direccion: @desplazamiento.direccion, email: @desplazamiento.email, nombres: @desplazamiento.nombres, numero_doc: @desplazamiento.numero_doc, observaciones: @desplazamiento.observaciones, telefonos: @desplazamiento.telefonos }
    end

    assert_redirected_to desplazamiento_path(assigns(:desplazamiento))
  end

  test "should show desplazamiento" do
    get :show, id: @desplazamiento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @desplazamiento
    assert_response :success
  end

  test "should update desplazamiento" do
    put :update, id: @desplazamiento, desplazamiento: { direccion: @desplazamiento.direccion, email: @desplazamiento.email, nombres: @desplazamiento.nombres, numero_doc: @desplazamiento.numero_doc, observaciones: @desplazamiento.observaciones, telefonos: @desplazamiento.telefonos }
    assert_redirected_to desplazamiento_path(assigns(:desplazamiento))
  end

  test "should destroy desplazamiento" do
    assert_difference('Desplazamiento.count', -1) do
      delete :destroy, id: @desplazamiento
    end

    assert_redirected_to desplazamientos_path
  end
end
