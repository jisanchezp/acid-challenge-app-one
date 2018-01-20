require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get validate" do
    get login_validate_url
    assert_response :success
  end

end
