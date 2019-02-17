require 'test_helper'

class CordinatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cordinate = cordinates(:one)
  end

  test "should get index" do
    get cordinates_url
    assert_response :success
  end

  test "should get new" do
    get new_cordinate_url
    assert_response :success
  end

  test "should create cordinate" do
    assert_difference('Cordinate.count') do
      post cordinates_url, params: { cordinate: { latitude: @cordinate.latitude, longitude: @cordinate.longitude } }
    end

    assert_redirected_to cordinate_url(Cordinate.last)
  end

  test "should show cordinate" do
    get cordinate_url(@cordinate)
    assert_response :success
  end

  test "should get edit" do
    get edit_cordinate_url(@cordinate)
    assert_response :success
  end

  test "should update cordinate" do
    patch cordinate_url(@cordinate), params: { cordinate: { latitude: @cordinate.latitude, longitude: @cordinate.longitude } }
    assert_redirected_to cordinate_url(@cordinate)
  end

  test "should destroy cordinate" do
    assert_difference('Cordinate.count', -1) do
      delete cordinate_url(@cordinate)
    end

    assert_redirected_to cordinates_url
  end
end
