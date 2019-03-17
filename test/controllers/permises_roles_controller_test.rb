require 'test_helper'

class permissionsRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permissions_role = permissions_roles(:one)
  end

  test "should get index" do
    get permissions_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_permissions_role_url
    assert_response :success
  end

  test "should create permissions_role" do
    assert_difference('permissionsRole.count') do
      post permissions_roles_url, params: { permissions_role: { permissions_id: @permissions_role.permissions_id, roles_id: @permissions_role.roles_id } }
    end

    assert_redirected_to permissions_role_url(permissionsRole.last)
  end

  test "should show permissions_role" do
    get permissions_role_url(@permissions_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_permissions_role_url(@permissions_role)
    assert_response :success
  end

  test "should update permissions_role" do
    patch permissions_role_url(@permissions_role), params: { permissions_role: { permissions_id: @permissions_role.permissions_id, roles_id: @permissions_role.roles_id } }
    assert_redirected_to permissions_role_url(@permissions_role)
  end

  test "should destroy permissions_role" do
    assert_difference('permissionsRole.count', -1) do
      delete permissions_role_url(@permissions_role)
    end

    assert_redirected_to permissions_roles_url
  end
end
