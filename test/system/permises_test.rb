require "application_system_test_case"

class permissionsTest < ApplicationSystemTestCase
  setup do
    @permission = permissions(:one)
  end

  test "visiting the index" do
    visit permissions_url
    assert_selector "h1", text: "permissions"
  end

  test "creating a permission" do
    visit permissions_url
    click_on "New permission"

    fill_in "Method", with: @permission.method
    fill_in "Object", with: @permission.object
    click_on "Create permission"

    assert_text "permission was successfully created"
    click_on "Back"
  end

  test "updating a permission" do
    visit permissions_url
    click_on "Edit", match: :first

    fill_in "Method", with: @permission.method
    fill_in "Object", with: @permission.object
    click_on "Update permission"

    assert_text "permission was successfully updated"
    click_on "Back"
  end

  test "destroying a permission" do
    visit permissions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "permission was successfully destroyed"
  end
end
