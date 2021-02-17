require 'test_helper'

class LojaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get loja_index_url
    assert_response :success
  end

end
