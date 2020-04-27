class RemoveLongFromEmergency < ActiveRecord::Migration[6.0]
  def change

    remove_column :emergencies, :long, :string
  end
end
