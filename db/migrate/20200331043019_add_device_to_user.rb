class AddDeviceToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :device, :string, foreign_key: true, unique: true
  end
end
