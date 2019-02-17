require "application_system_test_case"

class PermisesTest < ApplicationSystemTestCase
  setup do
    @permise = permises(:one)
  end

  test "visiting the index" do
    visit permises_url
    assert_selector "h1", text: "Permises"
  end

  test "creating a Permise" do
    visit permises_url
    click_on "New Permise"

    fill_in "Method", with: @permise.method
    fill_in "Object", with: @permise.object
    click_on "Create Permise"

    assert_text "Permise was successfully created"
    click_on "Back"
  end

  test "updating a Permise" do
    visit permises_url
    click_on "Edit", match: :first

    fill_in "Method", with: @permise.method
    fill_in "Object", with: @permise.object
    click_on "Update Permise"

    assert_text "Permise was successfully updated"
    click_on "Back"
  end

  test "destroying a Permise" do
    visit permises_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Permise was successfully destroyed"
  end
end
