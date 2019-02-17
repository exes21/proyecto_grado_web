require 'test_helper'

class Api::LocationControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get api_location_get_url
    assert_response :success
  end

end
