class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :fname
      t.string :lname
      t.string :cellphone
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
