require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "mycafe"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "help | mycafe"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | mycafe"
  end

end
