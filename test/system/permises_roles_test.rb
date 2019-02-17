require "application_system_test_case"

class PermisesRolesTest < ApplicationSystemTestCase
  setup do
    @permises_role = permises_roles(:one)
  end

  test "visiting the index" do
    visit permises_roles_url
    assert_selector "h1", text: "Permises Roles"
  end

  test "creating a Permises role" do
    visit permises_roles_url
    click_on "New Permises Role"

    fill_in "Permises", with: @permises_role.permises_id
    fill_in "Roles", with: @permises_role.roles_id
    click_on "Create Permises role"

    assert_text "Permises role was successfully created"
    click_on "Back"
  end

  test "updating a Permises role" do
    visit permises_roles_url
    click_on "Edit", match: :first

    fill_in "Permises", with: @permises_role.permises_id
    fill_in "Roles", with: @permises_role.roles_id
    click_on "Update Permises role"

    assert_text "Permises role was successfully updated"
    click_on "Back"
  end

  test "destroying a Permises role" do
    visit permises_roles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Permises role was successfully destroyed"
  end
end
