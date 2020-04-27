class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.integer :lat
      t.integer :long

      t.timestamps
    end
  end
end
