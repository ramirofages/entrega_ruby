require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, client: { birth_date: @client.birth_date, cuit: @client.cuit, document_number: @client.document_number, email: @client.email, first_name: @client.first_name, gender: @client.gender, last_name: @client.last_name, phone_number: @client.phone_number, skype: @client.skype }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  test "should show client" do
    get :show, id: @client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client
    assert_response :success
  end

  test "should update client" do
    patch :update, id: @client, client: { birth_date: @client.birth_date, cuit: @client.cuit, document_number: @client.document_number, email: @client.email, first_name: @client.first_name, gender: @client.gender, last_name: @client.last_name, phone_number: @client.phone_number, skype: @client.skype }
    assert_redirected_to client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_redirected_to clients_path
  end
end
