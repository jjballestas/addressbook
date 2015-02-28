require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "deberia ser redirigido a la pagina de login si no esta autenticado" do
    get :new
    
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "should get new when user is logged in" do
    sign_in users(:one)
    
    get :new
    assert_response :success
  end

  test "should not create contact without login" do
    assert_no_difference('Contact.count') do
      post :create, contact: { birthdate: @contact.birthdate, description: @contact.description, email: @contact.email, lastname: @contact.lastname, name: @contact.name, phone: @contact.phone, user_id: @contact.user_id }
    end

    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "should create contact" do
    sign_in users(:one)
    
    assert_difference('Contact.count') do
      post :create, contact: { birthdate: @contact.birthdate, description: @contact.description, email: @contact.email, lastname: @contact.lastname, name: @contact.name, phone: @contact.phone, user_id: @contact.user_id }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end
  
  test "should show contact" do
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact" do
    patch :update, id: @contact, contact: { birthdate: @contact.birthdate, description: @contact.description, email: @contact.email, lastname: @contact.lastname, name: @contact.name, phone: @contact.phone, user_id: @contact.user_id }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
end
