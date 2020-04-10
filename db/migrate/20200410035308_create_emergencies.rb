class CreateEmergencies < ActiveRecord::Migration[6.0]
  def change
    create_table :emergencies do |t|
      t.string :lat
      t.string :long
      t.references :device, null: false, foreign_key: true

      t.timestamps
    end
  end
end
