class AddAdminDeviceRefToDevice < ActiveRecord::Migration[6.0]
  def change
    add_reference :devices, :admin_device, foreign_key: true
  end
end
