class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name, null: false, default: ''
      t.integer :student_number
      t.integer :salary
      t.integer :type, null: false, default: 1

      t.timestamps
    end
  end
end
