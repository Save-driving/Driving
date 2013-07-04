require 'test_helper'

class AmbulanciasControllerTest < ActionController::TestCase
  setup do
    @ambulancia = ambulancias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ambulancias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ambulancia" do
    assert_difference('Ambulancia.count') do
      post :create, ambulancia: { direccion: @ambulancia.direccion, email: @ambulancia.email, nombres: @ambulancia.nombres, numero_doc: @ambulancia.numero_doc, observaciones: @ambulancia.observaciones, telefonos: @ambulancia.telefonos }
    end

    assert_redirected_to ambulancia_path(assigns(:ambulancia))
  end

  test "should show ambulancia" do
    get :show, id: @ambulancia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ambulancia
    assert_response :success
  end

  test "should update ambulancia" do
    put :update, id: @ambulancia, ambulancia: { direccion: @ambulancia.direccion, email: @ambulancia.email, nombres: @ambulancia.nombres, numero_doc: @ambulancia.numero_doc, observaciones: @ambulancia.observaciones, telefonos: @ambulancia.telefonos }
    assert_redirected_to ambulancia_path(assigns(:ambulancia))
  end

  test "should destroy ambulancia" do
    assert_difference('Ambulancia.count', -1) do
      delete :destroy, id: @ambulancia
    end

    assert_redirected_to ambulancias_path
  end
end
