require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test "que el contacto no se guarde vacio" do
    contact = Contact.new
    assert !contact.save, "el contacto se guardo vacio"
  end
  
  test "que el contacto se guarde con nombre y apellido" do
    contact = Contact.new
    contact.name =  'Pedro'
    assert_not contact.save, "el contacto se guarda con nombre pero sin apellido"
  end
  
  test "que el contacto se guarde con nombre y/o apellido" do
    contact = Contact.new
    contact.lastname =  contacts(:one).lastname
    assert_not contact.save, "el contacto se guarda con nombre pero sin apellido"
  end
end
