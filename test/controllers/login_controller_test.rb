require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get sigin" do
    get login_sigin_url
    assert_response :success
  end

  test "should get cadastrar" do
    get login_cadastrar_url
    assert_response :success
  end

  test "should get login" do
    get login_login_url
    assert_response :success
  end

  test "should get logar" do
    get login_logar_url
    assert_response :success
  end

end
