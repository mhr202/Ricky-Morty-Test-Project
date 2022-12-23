class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :model
      t.string :plate_number
      t.references :person, null: false

      t.timestamps
    end
  end
end
