class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.string :street
      t.string :city
      t.string :country
      t.references :person, null: false

      t.timestamps
    end
  end
end
