class CreateAdminDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_devices do |t|
      t.string :serial

      t.timestamps
    end
  end
end
