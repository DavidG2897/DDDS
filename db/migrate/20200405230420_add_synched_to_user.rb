class AddSynchedToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :synched, :boolean, default: false
  end
end
