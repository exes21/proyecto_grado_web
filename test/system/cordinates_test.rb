require "application_system_test_case"

class CordinatesTest < ApplicationSystemTestCase
  setup do
    @cordinate = cordinates(:one)
  end

  test "visiting the index" do
    visit cordinates_url
    assert_selector "h1", text: "Cordinates"
  end

  test "creating a Cordinate" do
    visit cordinates_url
    click_on "New Cordinate"

    fill_in "Latitude", with: @cordinate.latitude
    fill_in "Longitude", with: @cordinate.longitude
    click_on "Create Cordinate"

    assert_text "Cordinate was successfully created"
    click_on "Back"
  end

  test "updating a Cordinate" do
    visit cordinates_url
    click_on "Edit", match: :first

    fill_in "Latitude", with: @cordinate.latitude
    fill_in "Longitude", with: @cordinate.longitude
    click_on "Update Cordinate"

    assert_text "Cordinate was successfully updated"
    click_on "Back"
  end

  test "destroying a Cordinate" do
    visit cordinates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cordinate was successfully destroyed"
  end
end
