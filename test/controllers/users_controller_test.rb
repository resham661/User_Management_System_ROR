require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:teacher_user)
    @role = roles(:two)
  end

  def authenticated_header
    token = JsonWebToken.encode(user_id: @user.id)
    {
      'Authorization': "Bearer #{token}"
    }
  end

  test "should get index" do
    get users_url, headers: authenticated_header
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { full_name: @user.full_name, email: @user.email, username: @user.username, password: @user.password, role: @role.role_name } }, as: :json
    end
  end

  test "should show user" do
    get users_url(@user), headers: authenticated_header
    assert_response :success
  end

  test "should edit user" do
    patch user_url(@user), params: { user: { full_name: @user.full_name, email: @user.email, username: @user.username, password: @user.password, role: @role.role_name } }, as: :json, headers: authenticated_header
    assert_response :success
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user), as: :json
    end
    assert_response :no_content
  end

end
