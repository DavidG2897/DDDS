require "application_system_test_case"

class AdminDevicesTest < ApplicationSystemTestCase
  setup do
    @admin_device = admin_devices(:one)
  end

  test "visiting the index" do
    visit admin_devices_url
    assert_selector "h1", text: "Admin Devices"
  end

  test "creating a Admin device" do
    visit admin_devices_url
    click_on "New Admin Device"

    fill_in "Serial", with: @admin_device.serial
    click_on "Create Admin device"

    assert_text "Admin device was successfully created"
    click_on "Back"
  end

  test "updating a Admin device" do
    visit admin_devices_url
    click_on "Edit", match: :first

    fill_in "Serial", with: @admin_device.serial
    click_on "Update Admin device"

    assert_text "Admin device was successfully updated"
    click_on "Back"
  end

  test "destroying a Admin device" do
    visit admin_devices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Admin device was successfully destroyed"
  end
end
