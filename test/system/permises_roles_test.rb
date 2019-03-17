require "application_system_test_case"

class permissionsRolesTest < ApplicationSystemTestCase
  setup do
    @permissions_role = permissions_roles(:one)
  end

  test "visiting the index" do
    visit permissions_roles_url
    assert_selector "h1", text: "permissions Roles"
  end

  test "creating a permissions role" do
    visit permissions_roles_url
    click_on "New permissions Role"

    fill_in "permissions", with: @permissions_role.permissions_id
    fill_in "Roles", with: @permissions_role.roles_id
    click_on "Create permissions role"

    assert_text "permissions role was successfully created"
    click_on "Back"
  end

  test "updating a permissions role" do
    visit permissions_roles_url
    click_on "Edit", match: :first

    fill_in "permissions", with: @permissions_role.permissions_id
    fill_in "Roles", with: @permissions_role.roles_id
    click_on "Update permissions role"

    assert_text "permissions role was successfully updated"
    click_on "Back"
  end

  test "destroying a permissions role" do
    visit permissions_roles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "permissions role was successfully destroyed"
  end
end
