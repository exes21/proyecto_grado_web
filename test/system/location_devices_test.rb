require "application_system_test_case"

class LocationDevicesTest < ApplicationSystemTestCase
  setup do
    @location_device = location_devices(:one)
  end

  test "visiting the index" do
    visit location_devices_url
    assert_selector "h1", text: "Location Devices"
  end

  test "creating a Location device" do
    visit location_devices_url
    click_on "New Location Device"

    fill_in "Access point", with: @location_device.access_point_id
    fill_in "Coordenate", with: @location_device.coordenate_id
    click_on "Create Location device"

    assert_text "Location device was successfully created"
    click_on "Back"
  end

  test "updating a Location device" do
    visit location_devices_url
    click_on "Edit", match: :first

    fill_in "Access point", with: @location_device.access_point_id
    fill_in "Coordenate", with: @location_device.coordenate_id
    click_on "Update Location device"

    assert_text "Location device was successfully updated"
    click_on "Back"
  end

  test "destroying a Location device" do
    visit location_devices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Location device was successfully destroyed"
  end
end
