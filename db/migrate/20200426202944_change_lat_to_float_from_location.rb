class ChangeLatToFloatFromLocation < ActiveRecord::Migration[6.0]
  def change
	change_column(:locations, :lat, :float)
  end
end
