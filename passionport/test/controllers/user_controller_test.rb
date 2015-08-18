require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get homepage" do
    get :homepage
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
