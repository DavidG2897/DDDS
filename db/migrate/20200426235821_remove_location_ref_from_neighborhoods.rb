class RemoveLocationRefFromNeighborhoods < ActiveRecord::Migration[6.0]
  def change
    remove_reference :neighborhoods, :location, foreign_key: true
  end
end