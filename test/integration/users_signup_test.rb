require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest


# 無効なユーザーに対する登録のテスト
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end

  # 無効なユーザーに対する登録のテスト
    test "valid signup information" do
      get signup_path
      assert_difference 'User.count', 1 do
        post users_path, params: { user: { name:  "example_user",
                                           email: "user@example.com",
                                           password:              "foobar",
                                           password_confirmation: "foobar" } }
      end
      follow_redirect!
      assert_template 'users/show'
    end

end
