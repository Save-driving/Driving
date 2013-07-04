require 'test_helper'

class CarrotalleresControllerTest < ActionController::TestCase
  setup do
    @carrotaller = carrotalleres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carrotalleres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create carrotaller" do
    assert_difference('Carrotaller.count') do
      post :create, carrotaller: { direccion: @carrotaller.direccion, email: @carrotaller.email, nombres: @carrotaller.nombres, numero_doc: @carrotaller.numero_doc, observaciones: @carrotaller.observaciones, telefonos: @carrotaller.telefonos }
    end

    assert_redirected_to carrotaller_path(assigns(:carrotaller))
  end

  test "should show carrotaller" do
    get :show, id: @carrotaller
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @carrotaller
    assert_response :success
  end

  test "should update carrotaller" do
    put :update, id: @carrotaller, carrotaller: { direccion: @carrotaller.direccion, email: @carrotaller.email, nombres: @carrotaller.nombres, numero_doc: @carrotaller.numero_doc, observaciones: @carrotaller.observaciones, telefonos: @carrotaller.telefonos }
    assert_redirected_to carrotaller_path(assigns(:carrotaller))
  end

  test "should destroy carrotaller" do
    assert_difference('Carrotaller.count', -1) do
      delete :destroy, id: @carrotaller
    end

    assert_redirected_to carrotalleres_path
  end
end
