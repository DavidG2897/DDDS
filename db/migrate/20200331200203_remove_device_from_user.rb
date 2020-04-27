class RemoveDeviceFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :device, :string
  end
end
