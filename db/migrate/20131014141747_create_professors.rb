class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :lname
      t.string :fname
      t.string :mi
      t.string :status
      t.integer :units

      t.timestamps
    end
  end
end
