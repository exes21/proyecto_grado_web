require 'test_helper'

class LocationDevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_device = location_devices(:one)
  end

  test "should get index" do
    get location_devices_url
    assert_response :success
  end

  test "should get new" do
    get new_location_device_url
    assert_response :success
  end

  test "should create location_device" do
    assert_difference('LocationDevice.count') do
      post location_devices_url, params: { location_device: { access_point_id: @location_device.access_point_id, coordenate_id: @location_device.coordenate_id } }
    end

    assert_redirected_to location_device_url(LocationDevice.last)
  end

  test "should show location_device" do
    get location_device_url(@location_device)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_device_url(@location_device)
    assert_response :success
  end

  test "should update location_device" do
    patch location_device_url(@location_device), params: { location_device: { access_point_id: @location_device.access_point_id, coordenate_id: @location_device.coordenate_id } }
    assert_redirected_to location_device_url(@location_device)
  end

  test "should destroy location_device" do
    assert_difference('LocationDevice.count', -1) do
      delete location_device_url(@location_device)
    end

    assert_redirected_to location_devices_url
  end
end
