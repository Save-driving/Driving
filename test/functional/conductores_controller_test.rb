require 'test_helper'

class ConductoresControllerTest < ActionController::TestCase
  setup do
    @conductor = conductores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conductores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conductor" do
    assert_difference('Conductor.count') do
      post :create, conductor: { direccion: @conductor.direccion, email: @conductor.email, nombres: @conductor.nombres, numero_doc: @conductor.numero_doc, observaciones: @conductor.observaciones, telefonos: @conductor.telefonos }
    end

    assert_redirected_to conductor_path(assigns(:conductor))
  end

  test "should show conductor" do
    get :show, id: @conductor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conductor
    assert_response :success
  end

  test "should update conductor" do
    put :update, id: @conductor, conductor: { direccion: @conductor.direccion, email: @conductor.email, nombres: @conductor.nombres, numero_doc: @conductor.numero_doc, observaciones: @conductor.observaciones, telefonos: @conductor.telefonos }
    assert_redirected_to conductor_path(assigns(:conductor))
  end

  test "should destroy conductor" do
    assert_difference('Conductor.count', -1) do
      delete :destroy, id: @conductor
    end

    assert_redirected_to conductores_path
  end
end
