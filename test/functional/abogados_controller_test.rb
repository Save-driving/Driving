require 'test_helper'

class AbogadosControllerTest < ActionController::TestCase
  setup do
    @abogado = abogados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:abogados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create abogado" do
    assert_difference('Abogado.count') do
      post :create, abogado: { direccion: @abogado.direccion, email: @abogado.email, nombres: @abogado.nombres, numero_doc: @abogado.numero_doc, observaciones: @abogado.observaciones, telefonos: @abogado.telefonos }
    end

    assert_redirected_to abogado_path(assigns(:abogado))
  end

  test "should show abogado" do
    get :show, id: @abogado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @abogado
    assert_response :success
  end

  test "should update abogado" do
    put :update, id: @abogado, abogado: { direccion: @abogado.direccion, email: @abogado.email, nombres: @abogado.nombres, numero_doc: @abogado.numero_doc, observaciones: @abogado.observaciones, telefonos: @abogado.telefonos }
    assert_redirected_to abogado_path(assigns(:abogado))
  end

  test "should destroy abogado" do
    assert_difference('Abogado.count', -1) do
      delete :destroy, id: @abogado
    end

    assert_redirected_to abogados_path
  end
end
