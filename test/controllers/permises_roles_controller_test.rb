require 'test_helper'

class PermisesRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permises_role = permises_roles(:one)
  end

  test "should get index" do
    get permises_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_permises_role_url
    assert_response :success
  end

  test "should create permises_role" do
    assert_difference('PermisesRole.count') do
      post permises_roles_url, params: { permises_role: { permises_id: @permises_role.permises_id, roles_id: @permises_role.roles_id } }
    end

    assert_redirected_to permises_role_url(PermisesRole.last)
  end

  test "should show permises_role" do
    get permises_role_url(@permises_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_permises_role_url(@permises_role)
    assert_response :success
  end

  test "should update permises_role" do
    patch permises_role_url(@permises_role), params: { permises_role: { permises_id: @permises_role.permises_id, roles_id: @permises_role.roles_id } }
    assert_redirected_to permises_role_url(@permises_role)
  end

  test "should destroy permises_role" do
    assert_difference('PermisesRole.count', -1) do
      delete permises_role_url(@permises_role)
    end

    assert_redirected_to permises_roles_url
  end
end
