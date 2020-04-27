require 'test_helper'

class AdminDevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_device = admin_devices(:one)
  end

  test "should get index" do
    get admin_devices_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_device_url
    assert_response :success
  end

  test "should create admin_device" do
    assert_difference('AdminDevice.count') do
      post admin_devices_url, params: { admin_device: { serial: @admin_device.serial } }
    end

    assert_redirected_to admin_device_url(AdminDevice.last)
  end

  test "should show admin_device" do
    get admin_device_url(@admin_device)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_device_url(@admin_device)
    assert_response :success
  end

  test "should update admin_device" do
    patch admin_device_url(@admin_device), params: { admin_device: { serial: @admin_device.serial } }
    assert_redirected_to admin_device_url(@admin_device)
  end

  test "should destroy admin_device" do
    assert_difference('AdminDevice.count', -1) do
      delete admin_device_url(@admin_device)
    end

    assert_redirected_to admin_devices_url
  end
end
