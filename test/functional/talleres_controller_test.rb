require 'test_helper'

class TalleresControllerTest < ActionController::TestCase
  setup do
    @taller = talleres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:talleres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taller" do
    assert_difference('Taller.count') do
      post :create, taller: { direccion: @taller.direccion, email: @taller.email, nombres: @taller.nombres, numero_doc: @taller.numero_doc, observaciones: @taller.observaciones, telefonos: @taller.telefonos }
    end

    assert_redirected_to taller_path(assigns(:taller))
  end

  test "should show taller" do
    get :show, id: @taller
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @taller
    assert_response :success
  end

  test "should update taller" do
    put :update, id: @taller, taller: { direccion: @taller.direccion, email: @taller.email, nombres: @taller.nombres, numero_doc: @taller.numero_doc, observaciones: @taller.observaciones, telefonos: @taller.telefonos }
    assert_redirected_to taller_path(assigns(:taller))
  end

  test "should destroy taller" do
    assert_difference('Taller.count', -1) do
      delete :destroy, id: @taller
    end

    assert_redirected_to talleres_path
  end
end
