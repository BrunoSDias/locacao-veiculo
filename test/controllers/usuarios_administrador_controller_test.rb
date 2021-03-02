require 'test_helper'

class UsuariosAdministradorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get usuarios_administrador_index_url
    assert_response :success
  end

end
