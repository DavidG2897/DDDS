class CreateNeighborhoods < ActiveRecord::Migration[6.0]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
