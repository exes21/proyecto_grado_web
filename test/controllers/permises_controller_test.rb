require 'test_helper'

class permissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permission = permissions(:one)
  end

  test "should get index" do
    get permissions_url
    assert_response :success
  end

  test "should get new" do
    get new_permission_url
    assert_response :success
  end

  test "should create permission" do
    assert_difference('permission.count') do
      post permissions_url, params: { permission: { method: @permission.method, object: @permission.object } }
    end

    assert_redirected_to permission_url(permission.last)
  end

  test "should show permission" do
    get permission_url(@permission)
    assert_response :success
  end

  test "should get edit" do
    get edit_permission_url(@permission)
    assert_response :success
  end

  test "should update permission" do
    patch permission_url(@permission), params: { permission: { method: @permission.method, object: @permission.object } }
    assert_redirected_to permission_url(@permission)
  end

  test "should destroy permission" do
    assert_difference('permission.count', -1) do
      delete permission_url(@permission)
    end

    assert_redirected_to permissions_url
  end
end
