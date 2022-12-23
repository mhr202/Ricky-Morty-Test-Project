class CreateDrives < ActiveRecord::Migration[5.2]
  def change
    create_table :drives do |t|
      t.datetime :date
      t.integer :distance
      t.references :person, null: false
      t.references :vehicle, null: false

      t.timestamps
    end
  end
end
