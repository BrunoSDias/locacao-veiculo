require 'test_helper'

class LoginAdministradorControllerTest < ActionDispatch::IntegrationTest
  test "should get signin" do
    get login_administrador_signin_url
    assert_response :success
  end

end
