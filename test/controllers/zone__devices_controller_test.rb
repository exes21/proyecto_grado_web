require 'test_helper'

class ZoneDevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @zone__device = zone__devices(:one)
  end

  test "should get index" do
    get zone__devices_url
    assert_response :success
  end

  test "should get new" do
    get new_zone__device_url
    assert_response :success
  end

  test "should create zone__device" do
    assert_difference('ZoneDevice.count') do
      post zone__devices_url, params: { zone__device: { access_point_id: @zone__device.access_point_id, zone_id: @zone__device.zone_id } }
    end

    assert_redirected_to zone__device_url(ZoneDevice.last)
  end

  test "should show zone__device" do
    get zone__device_url(@zone__device)
    assert_response :success
  end

  test "should get edit" do
    get edit_zone__device_url(@zone__device)
    assert_response :success
  end

  test "should update zone__device" do
    patch zone__device_url(@zone__device), params: { zone__device: { access_point_id: @zone__device.access_point_id, zone_id: @zone__device.zone_id } }
    assert_redirected_to zone__device_url(@zone__device)
  end

  test "should destroy zone__device" do
    assert_difference('ZoneDevice.count', -1) do
      delete zone__device_url(@zone__device)
    end

    assert_redirected_to zone__devices_url
  end
end
