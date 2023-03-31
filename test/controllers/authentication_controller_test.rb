require 'test_helper'
class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should post login" do
    post auth_login_path, params: { email: "123@gmail.com" ,password:"123" }, as: :json
    assert_response :success
  end
end
