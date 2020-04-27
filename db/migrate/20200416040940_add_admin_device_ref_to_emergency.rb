class AddAdminDeviceRefToEmergency < ActiveRecord::Migration[6.0]
  def change
    add_reference :emergencies, :admin_device, foreign_key: true
  end
end
