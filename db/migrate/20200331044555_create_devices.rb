class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :dispid
      t.string :fwrev, default: '1.0'
      t.timestamps
    end
  end
end
