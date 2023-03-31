require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role = roles(:one)
    @user = users(:teacher)
  end

  def authenticated_header
    token = JsonWebToken.encode(user_id: @user.id)

    {
      'Authorization': "Bearer #{token}"
    }
  end
  test "should get index" do
    get roles_url, headers: authenticated_header
    assert_response :success
  end

  test "should create role" do
    assert_difference("Role.count") do
      post roles_url, headers: authenticated_header, params: { role: { role_name: @role.role_name } }
    end
  end

  test "should show role" do
    get role_url(@role), headers: authenticated_header
    assert_response :success
  end

  test "should destroy role" do
    assert_difference("Role.count", -1) do
      delete role_url(@role), headers: authenticated_header
    end
  end
end
