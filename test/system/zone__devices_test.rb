require "application_system_test_case"

class ZoneDevicesTest < ApplicationSystemTestCase
  setup do
    @zone__device = zone__devices(:one)
  end

  test "visiting the index" do
    visit zone__devices_url
    assert_selector "h1", text: "Zone Devices"
  end

  test "creating a Zone  device" do
    visit zone__devices_url
    click_on "New Zone Device"

    fill_in "Access point", with: @zone__device.access_point_id
    fill_in "Zone", with: @zone__device.zone_id
    click_on "Create Zone  device"

    assert_text "Zone  device was successfully created"
    click_on "Back"
  end

  test "updating a Zone  device" do
    visit zone__devices_url
    click_on "Edit", match: :first

    fill_in "Access point", with: @zone__device.access_point_id
    fill_in "Zone", with: @zone__device.zone_id
    click_on "Update Zone  device"

    assert_text "Zone  device was successfully updated"
    click_on "Back"
  end

  test "destroying a Zone  device" do
    visit zone__devices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Zone  device was successfully destroyed"
  end
end
