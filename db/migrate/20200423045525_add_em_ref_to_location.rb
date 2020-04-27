class AddEmRefToLocation < ActiveRecord::Migration[6.0]
  def change
    add_reference :locations, :emergency, foreign_key: true
  end
end
