class AddNeighborhoodRefToLocation < ActiveRecord::Migration[6.0]
  def change
    add_reference :locations, :neighborhood, foreign_key: true
  end
end