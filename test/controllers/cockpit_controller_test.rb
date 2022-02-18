require 'test_helper'

class CockpitControllerTest < ActionDispatch::IntegrationTest
  test "should get admin" do
    get cockpit_admin_url
    assert_response :success
  end

  test "should get user" do
    get cockpit_user_url
    assert_response :success
  end

end
