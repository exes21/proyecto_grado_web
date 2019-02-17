require 'test_helper'

class AccessPointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @access_point = access_points(:one)
  end

  test "should get index" do
    get access_points_url
    assert_response :success
  end

  test "should get new" do
    get new_access_point_url
    assert_response :success
  end

  test "should create access_point" do
    assert_difference('AccessPoint.count') do
      post access_points_url, params: { access_point: { ip_address: @access_point.ip_address, mac_address: @access_point.mac_address, password: @access_point.password, user: @access_point.user } }
    end

    assert_redirected_to access_point_url(AccessPoint.last)
  end

  test "should show access_point" do
    get access_point_url(@access_point)
    assert_response :success
  end

  test "should get edit" do
    get edit_access_point_url(@access_point)
    assert_response :success
  end

  test "should update access_point" do
    patch access_point_url(@access_point), params: { access_point: { ip_address: @access_point.ip_address, mac_address: @access_point.mac_address, password: @access_point.password, user: @access_point.user } }
    assert_redirected_to access_point_url(@access_point)
  end

  test "should destroy access_point" do
    assert_difference('AccessPoint.count', -1) do
      delete access_point_url(@access_point)
    end

    assert_redirected_to access_points_url
  end
end
