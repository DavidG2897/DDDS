class ChangeLongToFloatFromLocation < ActiveRecord::Migration[6.0]
  def change
  	change_column(:locations, :long, :float)
  end
end
