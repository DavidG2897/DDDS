class RemoveLatFromEmergency < ActiveRecord::Migration[6.0]
  def change

    remove_column :emergencies, :lat, :string
  end
end
